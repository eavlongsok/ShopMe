<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomePage
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::guard('buyer')->check() && !Auth::guard('seller')->check())
            return redirect('/login');
        if (Auth::guard('buyer')->check()) {
            $buyer = Auth::guard('buyer')->user();
            if ($buyer->status == 0) {
                Auth::guard('buyer')->logout();
                return redirect('/login');
            }
        }
        if (Auth::guard('seller')->check()) {
            $seller = Auth::guard('seller')->user();
            if ($seller->status == 0) {
                Auth::guard('seller')->logout();
                return redirect('/login');
            }
        }
        return $next($request);
    }
}
