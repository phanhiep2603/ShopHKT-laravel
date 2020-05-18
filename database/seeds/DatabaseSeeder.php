<?php

use App\user;
use Illuminate\Database\Seeder;


class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        User::create([
            'email' => 'admin@gmail.com',
            'password' => bcrypt('12345678'),
            'username' => 'Admin',
            'fullname' => 'Admin',
            'gender' => 'male',
            'address' => '123 ABC',
            'phone' => '0908122860',
            'level' => 1,
            'status' => 'admin',
        ]);
    }
}
