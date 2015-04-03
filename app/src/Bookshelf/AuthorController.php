<?php

namespace Bookshelf;

use Bookshelf\Author;

final class AuthorController
{
    private $view;

    public function __construct($view)
    {
        $this->view = $view;
    }

    public function listAuthors($request, $response)
    {
        $this->view->render('bookshelf/author/list.twig', [
            'authors' => Author::all()
        ]);
    }
}
