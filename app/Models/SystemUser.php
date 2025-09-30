<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SystemUser extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'email', 'phone',
        'address', 'created_at', 'updated_at',
        'updated_by', 'created_by', 'status_id'
    ];
}
