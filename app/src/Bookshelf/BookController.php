<?php

namespace Bookshelf;

use Slim\Views\Twig;
use Slim\Router;
use Bookshelf\Author;
use Bookshelf\Book;

final class BookController
{
    private $view;
    private $router;

    public function __construct(Twig $view, Router $router)
    {
        $this->view = $view;
        $this->router = $router;
    }

    public function listBooks($request, $response, $params)
    {
        return $this->view->render($response, 'bookshelf/book/list.twig', [
            'books' => Book::all(),
        ]);
    }
}
