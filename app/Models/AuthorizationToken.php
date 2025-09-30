<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AuthorizationToken extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id', 'profile','token','expires_at','created_at', 'updated_at'
    ];
}
