<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttachmentType extends Model
{
    CONST PASSPORT_ATTACHMENT_TYPE = 1;

    use HasFactory;

    protected $fillable = [
        'name', 'created_at', 'updated_at'
    ];
}
