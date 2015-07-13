<?php

namespace Bookshelf;

use Bookshelf\Author;
use Bookshelf\Book;

final class BookController
{
    private $view;

    public function __construct($view)
    {
        $this->view = $view;
    }

    public function listBooks($request, $response, $params)
    {
        return $this->view->render($response, 'bookshelf/book/list.twig', [
            'books' => Book::all(),
        ]);
    }
}
