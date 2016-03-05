<?php
namespace Bookshelf;

class AuthorRepository
{
    public function all()
    {
        return Author::all();
    }

    public function find($id, $columns = ['*'])
    {
        return Author::find($id, $columns);
    }
}
