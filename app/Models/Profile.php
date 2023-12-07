<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Profile extends Model
{
    use HasFactory;
    protected $fillable=['home_town','phone_number'];
    public function author(){
        return $this->belongsTo(Author::class,'authorr_id');
    }
}
