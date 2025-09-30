<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\System\State;

class LivestockAttachment extends Model
{
    use HasFactory;

    protected $fillable = [
        'attachment_id', 'livestock_id', 'created_at', 'updated_at', 'state_id', 'created_by', 'updated_by'
    ];

    public function status()
    {
        return $this->belongsTo(State::class, 'state_id');
    }
}
