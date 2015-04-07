<?php
namespace Bookshelf;

use Illuminate\Database\Eloquent\Model;

final class Book extends Model
{
    public function author()
    {
        return $this->belongsTo('Bookshelf\Author');
    }
}
