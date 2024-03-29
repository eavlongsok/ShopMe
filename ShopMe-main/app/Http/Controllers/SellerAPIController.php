<?php

namespace App\Http\Controllers;

use App\Models\Seller;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class SellerAPIController extends Controller
{
    //
    public function getCategories() {
        $categories = DB::table('category')->orderBy('category_name')->get();
        if (isset($categories)) {
            return response()->json(['categories' => $categories], 200);
        }
        else {
            return response()->json(['categories' => 'No categories found'], 404);
        }
    }

    public function getRegion(){
        $province = DB::table('region')->orderBy('region_name', 'asc')->get();
        if(isset($province)){
            return response()->json(['province' => $province], 200);
        }
        else{
            return response()->json(['province' => 'No province found'], 404);
        }

    }

    public function registerProduct(Request $request) {
        $validation = Validator::make($request->all(), [
            "name" => "required|string|max:100",
            "category" => "required|numeric",
            "condition" => "required|numeric",
            "price" => "required|numeric|min:1",
            "quantity" => "required|numeric",
            "description" => "required|max:255",
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:5120'
        ]);

        if ($validation->fails()) {
            return response()->json(['errors' => $validation->errors(), 'dataSent' => $request->all()], 422);
        }

        $seller_id = Auth::guard('seller_token')->user()->seller_id;

        $registerID = DB::table('product')->insertGetId([
            'seller_id' => $seller_id,
            'product_name' => $request->input('name'),
            'category_id' => $request->input('category'),
            'price' => $request->input('price'),
            'quantity' => $request->input('quantity'),
            'product_condition' => $request->input('condition'),
            'product_description' => $request->input('description'),
        ]);

        if ($registerID) {
            $listing_request = DB::table('listing_request')->insert([
                'product_id' => $registerID
            ]);

            $img_link = $this->uploadImage($request, 'image');

            if (isset($img_link)) {
                $storeImage = DB::table('product_img')->insert([
                    'product_id' => $registerID,
                    'img_url' => $img_link
                ]);
            }

        if ($registerID && $storeImage) {
            return response()->json(['success' => 'sucessfully inserted'], 200);
        }
        else return response()->json(['failed' => 'failed to insert'], 500);
        }
    }

    public function test(Request $request) {
        // return response()->json(['message' => 'hi']);
        $image = $request->file('image');
        // $imageName = time() . '-' . $image->getClientOriginalName() . '.' . $image->extension();
        $client = new Client();
        $response = $client->request('POST', 'https://api.imgur.com/3/image', [
            'headers' => [
                    'authorization' => 'Client-ID ' . env('imgur_client_id'),
                    'content-type' => 'application/x-www-form-urlencoded',
                ],
            'form_params' => [
                    'image' => base64_encode(file_get_contents($image))
                ],
            ]);
        return json_decode($response->getBody()->getContents())->data->link;
    }

    public function getSellerInfo (Request $request) {
        $seller_id = $request->user()->seller_id;
        $seller = DB::table('seller')->where('seller.seller_id', $seller_id)->leftJoin('verification', 'seller.seller_id', '=', 'verification.seller_id')->take(1)->get(['seller.seller_id', 'seller.first_name', 'seller.last_name', 'seller.email', 'seller.img_url', 'seller.date_of_birth', 'seller.created_at', 'verification.ver_id', 'verification.store_name', 'verification.business_info', 'verification.verified_by', 'verification.verified_at']);

        $seller = $seller[0];

        // $verification = DB::table('verification')->where('seller_id', $seller_id)->first();

        // if (isset($verification)) $verificationRequested = true;
        // else $verificationRequested = false;

        // if (isset($seller)) {
        //     $seller = [
        //         'seller_id' => $seller->seller_id,
        //         'first_name' => $seller->first_name,
        //         'last_name' => $seller->last_name,
        //         'email' => $seller->email,
        //         'date_of_birth' => $seller->date_of_birth,
        //         'created_at' => $seller->created_at,
        //         'verification_requested' => $verificationRequested,
        //     ];

        //     if ($verificationRequested) {
        //         $seller['verification'] = [
        //             'ver_id' => $verification->ver_id,
        //             'store_name' => $verification->store_name,
        //             'business_info' => $verification->business_info,
        //             'verified_by' => $verification->verified_by,
        //             'verified_at' => $verification->verified_at,
        //             'created_at' => $verification->created_at,
        //         ];
        //     }

            return response()->json($seller, 200);
        // }
        // else {
        //     return response()->json(['seller' => 'No seller found'], 404);
        // }
    }

    public function verify(Request $request){
        $validation = Validator::make($request->all(), [
            'business_name' => 'required',
            'building_number' => 'required',
            'street_number' => 'required',
            'city' => 'required',
            'province' => 'required',
            'zip_code' => 'required|integer|digits_between:5,6',
            'business_info' => 'required',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif|max:5120'

        ]);
        if($validation->fails()){

            return response()->json(['errors' => $validation->errors()],422);
        }

        $seller_id = $request->user()->seller_id;

        $business_name = trim($request->input('business_name'));
        $building_number = trim($request->input('building_number'));
        $street_number = trim($request->input('street_number'));
        $city = trim($request->input('city'));
        $province = trim($request->input('province'));
        $zip_code = trim($request->input('zip_code'));
        $business_info = trim($request->input('business_info'));
        $logo = $this->uploadImage($request, 'logo');

        // return response()->json(['store_name' => $business_name, 'business_info' => $business_info, 'typeName' => gettype($business_name), 'typeInfo' => gettype($business_info)]);

        $seller = $request->user();
        $seller->img_url = $logo;
        $seller->save();

        $verification = DB::table('verification')->insert([
            'seller_id' => $seller_id,
            'store_name' => $business_name,
            'business_info' => $business_info,
            'created_at' => Carbon::now()
        ]);


        if ($verification) {
            $address = DB::table('address')->insert([
                'seller_id' => $seller_id,
                'region_id' => intval($province),
                'building_number' => $building_number,
                'street_number' => $street_number,
                'city' => $city,
                'zipcode' => $zip_code,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]);
            if ($address) {
                return response()->json(['success', 'successfully request for verification']);
            }
        }

        return response()->json($request);
    }

    public function editAccount(Request $request) {
        $seller = $request->user();
        $email = $request->input('email');
        $password = $request->input('password');

        if ($email == $seller->email) {
            $rules = [
                'password' => 'required|min:8',
                'confirmPassword' => 'same:password',
            ];
        }
        else {
            if (isset($password)) {
                $rules = [
                    'email' => 'required|email|unique:seller,email',
                    'password' => 'required|min:8',
                    'confirmPassword' => 'same:password',
                ];
            }
            else {
                $rules = [
                    'email' => 'required|email|unique:seller,email',
                ];
            }
        }

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $seller->email = $email;
        if (isset($password)) {
            if (Hash::check($password, $seller->password)) {
                return response()->json(['errors' => ['password' => ['password cannot be the same as the old one']]], 422);
            }
            else {
                $seller->password = Hash::make($password);
            }
        }
        $seller->updated_at = Carbon::now();
        $seller->save();

        return response()->json(['success' => 'successfully updated'], 200);

    }

    public function editLogo(Request $request) {
        $seller = $request->user();

        $validator = Validator::make($request->all(), [
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif|max:5120'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $logo = $this->uploadImage($request, 'logo');

        if (empty($logo)) {
            return response()->json(['errors' => ['logo' => ['failed to upload logo']]], 500);
        }

        $seller->img_url = $logo;
        $seller->updated_at = Carbon::now();
        $seller->save();

        return response()->json(['success' => 'successfully updated', 'img_url' => $logo], 200);
    }

    public function editProductImage(Request $request) {
        $product_id = $request->input('product_id');

        $validator = Validator::make($request->all(), [
            'img' => 'required|image|mimes:jpeg,png,jpg,gif|max:5120'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $img = $this->uploadImage($request, 'img');

        if (empty($img)) {
            return response()->json(['errors' => 'failed to upload image'], 500);
        }

       DB::table('product_img')->where('product_id', $product_id)->update(['img_url' => $img]);

       DB::table('product')->where('product_id', $product_id)->update(['updated_at' => Carbon::now()]);

        return response()->json(['success' => 'successfully updated', 'img_url' => $img], 200);
    }

    public function editProductInfo(Request $request) {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|integer',
            'name' => 'required|string|max:100',
            'description' => 'required|string|max:255',
            'price' => 'required|numeric|min:1'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $product_id = $request->input('product_id');
        $product_name = $request->input('name');
        $product_description = $request->input('description');
        $product_price = $request->input('price');

        $update = DB::table('product')->where('product_id', $product_id)->update(['product_name' => $product_name, 'product_description' => $product_description, 'price' => $product_price, 'updated_at' => Carbon::now()]);

        if (isset($update)) {
            return response()->json(['success' => 'successfully updated'], 200);
        }
    }

    public function addProductQuantity(Request $request) {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|integer',
            'quantity' => 'required|integer|min:1'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $product_id = $request->input('product_id');
        $quantity = $request->input('quantity');

        $increment = DB::table('product')->where('product_id', $product_id)->increment('quantity', $quantity);

        if (isset($increment)) {
            $update = DB::table('product')->where('product_id', $product_id)->update(['updated_at' => Carbon::now()]);
        }

        if (isset($update)) {
            return response()->json(['success' => 'successfully updated'], 200);
        }
    }

    public function removeProduct(Request $request) {
        $product_id = $request->input('product_id');
        DB::table('product')->where('product_id', $product_id)->delete();
        DB::table('listing_request')->where('product_id', $product_id)->delete();
        DB::table('product_img')->where('product_id', $product_id)->delete();

        return response()->json(['success' => 'successfully deleted'], 200);
    }

    public function getProducts(Request $request) {
        $seller_id = $request->user()->seller_id;
        $products = DB::table('product')->join('product_img', 'product_img.product_id', 'product.product_id')->join('category', 'category.category_id', 'product.category_id')->join('listing_request', 'listing_request.product_id', 'product.product_id')->where('product.seller_id', $seller_id)->where('product.is_approved', 1)->orderBy('product.product_sold', 'desc')->orderBy('product.created_at', 'asc')->get();

        return response()->json(['products' => $products], 200);
    }

    public function getPendingApprovalProducts(Request $request) {
        $seller_id = $request->user()->seller_id;
        $products = DB::table('product')->join('product_img', 'product_img.product_id', 'product.product_id')->join('category', 'category.category_id', 'product.category_id')->join('listing_request', 'listing_request.product_id', 'product.product_id')->where('product.seller_id', $seller_id)->where('product.is_approved', 0)->orderBy('product.product_sold', 'desc')->orderBy('product.created_at', 'asc')->get();

        return response()->json(['products' => $products], 200);

    }

    public function uploadImage(Request $request, $name) {
        $image = $request->file($name);
            $client = new Client();
            $response = $client->request('POST', 'https://api.imgur.com/3/image', [
                'headers' => [
                        'authorization' => 'Client-ID ' . env('imgur_client_id'),
                        'content-type' => 'application/x-www-form-urlencoded',
                    ],
                'form_params' => [
                        'image' => base64_encode(file_get_contents($image))
                    ],
                'verify' => false
                ]);
            return json_decode($response->getBody()->getContents())->data->link;
    }

}

