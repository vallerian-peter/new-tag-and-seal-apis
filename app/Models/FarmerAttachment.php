<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\State;

class FarmerAttachment extends Model
{
    use HasFactory;

    protected $fillable = [
        'attachment_id', 'farmer_id', 'created_at', 'updated_at', 'state_id', 'created_by', 'updated_by'
    ];

    public function status()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function attachment()
    {
        return $this->belongsTo(Attachment::class, 'attachment_id');
    }

    public function passport()
    {
        return $this->belongsTo(Attachment::class, 'attachment_id')->where(['attachment_type_id' => 1]);
    }
}
