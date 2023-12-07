<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    use HasFactory;
    protected $fillable=['name'];
    
    public function profile(){
        return $this->hasOne(Profile::class,"authorr_id");
    }

    /**
     * The roles that belong to the Author
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function books()
    {
        return $this->belongsToMany(Book::class, 'author_book')->withPivot('is_active')->withTimestamps();
    }

}
