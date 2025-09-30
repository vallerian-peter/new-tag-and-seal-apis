<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LivestockInseminationSemenStrawTypes extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'name',
        'category',
        'color',
        'created_at',
        'updated_at',
    ];
}
