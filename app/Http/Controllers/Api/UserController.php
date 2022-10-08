<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class UserController extends Controller
{
    /**
     * @param  Request  $request
     * @return mixed
     */
    public function info(Request $request): mixed
    {
        return $request->user();
    }
}
