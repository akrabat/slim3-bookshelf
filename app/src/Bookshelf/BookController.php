<?php

namespace Bookshelf;

use Slim\Views\Twig;
use Slim\Router;
use Slim\Flash\Messages as FlashMessages;
use Bookshelf\Author;
use Bookshelf\Book;

final class BookController
{
    private $view;
    private $router;
    private $flash;

    public function __construct(Twig $view, Router $router, FlashMessages $flash)
    {
        $this->view = $view;
        $this->router = $router;
        $this->flash = $flash;
    }

    public function listBooks($request, $response, $params)
    {
        return $this->view->render($response, 'bookshelf/book/list.twig', [
            'books' => Book::all(),
        ]);
    }
}
