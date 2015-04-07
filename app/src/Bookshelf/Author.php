<?php
namespace Bookshelf;

use Illuminate\Database\Eloquent\Model;

final class Author extends Model
{
    public function books()
    {
        return $this->hasMany('Bookshelf\Book');
    }
}
