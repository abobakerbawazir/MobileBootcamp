<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;
    protected $fillable=['code','name'];
     /**
     * Get all of the comments for the Account
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function account(){
        return $this->hasMany(Account::class);
    }
}
