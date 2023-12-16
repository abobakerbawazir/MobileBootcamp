<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Accounttype extends Model
{
    protected $fillable=['name'];
    use HasFactory;
     /**
     * Get all of the comments for the Category
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function account(){
        return $this->hasMany(Account::class);
    }
}
