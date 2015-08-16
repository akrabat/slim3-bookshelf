<?php

namespace Bookshelf;

use Slim\Views\Twig;
use Slim\Router;
use Bookshelf\Author;

final class AuthorController
{
    private $view;
    private $router;

    public function __construct(Twig $view, Router $router)
    {
        $this->view = $view;
        $this->router = $router;
    }

    public function listAuthors($request, $response)
    {
        return $this->view->render($response, 'bookshelf/author/list.twig', [
            'authors' => Author::all()
        ]);
    }

    public function listBooks($request, $response, $params)
    {
        if (isset($params['author_id'])) {
            $author = Author::find((int)$params['author_id']);
            if (!$author) {
                // not found
                throw new \Exception("Author {$params['author_id']} not found");
            }
            $books = $author->books;
        }
        return $this->view->render($response, 'bookshelf/author/books.twig', [
            'author' => $author,
            'books' => $books,
        ]);
    }
}
