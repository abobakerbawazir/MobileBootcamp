<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    use HasFactory;
    protected $fillable = ['name'];

    /**
     * Get all of the comments for the Category
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function account()
    {
        return $this->hasMany(Account::class);
    }
    
}
