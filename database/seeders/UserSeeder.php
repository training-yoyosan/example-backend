<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if (User::count() == 0) {
            User::create([
                'name'           => 'Admin',
                'email'          => 'admin@example.local',
                'password'       => bcrypt('test1234'),
                'remember_token' => Str::random(60),
            ]);
        }
    }
}
