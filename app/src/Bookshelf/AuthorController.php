<?php

namespace Bookshelf;

use Slim\Views\Twig;
use Slim\Router;
use Slim\Flash\Messages as FlashMessages;
use Bookshelf\AuthorRepository;
use Bookshelf\Author;

final class AuthorController
{
    private $view;
    private $router;
    private $flash;

    /**
     * AuthorRepository
     * @var [type]
     */
    private $authorRepository;

    public function __construct(
        Twig $view,
        Router $router,
        FlashMessages $flash,
        AuthorRepository $authorRepository
    ) {
        $this->view = $view;
        $this->router = $router;
        $this->flash = $flash;
        $this->authorRepository = $authorRepository;
    }

    public function listAuthors($request, $response)
    {
        return $this->view->render($response, 'bookshelf/author/list.twig', [
            'authors' => $this->authorRepository->all()
        ]);
    }

    public function listBooks($request, $response, $params)
    {
        if (isset($params['author_id'])) {
            $author = $this->authorRepository->find((int)$params['author_id']);
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

    public function editAuthor($request, $response, $params)
    {
        $author = $this->authorRepository->find((int)$params['author_id']);
        if (!$author) {
            $uri = $request->getUri()->withQuery('')->withPath($this->router->pathFor('list-authors'));
            return $response->withRedirect((string)$uri);
        }

        $errors = null;
        if ($request->isPost()) {
            if ($request->getAttribute('csrf_status') === false) {
                $errors['form'] = 'CSRF faiure';
            } else {
                $data = $request->getParsedBody();
                $validator = $author->getValidator($data);
                if ($validator->validate()) {
                    $author->update($data);

                    $this->flash->addMessage('message', 'Author updated');
                    
                    $uri = $request
                            ->getUri()
                            ->withQuery('')
                            ->withPath($this->router->pathFor('author', ['author_id' => $author->id]));
                    return $response->withRedirect((string)$uri);
                } else {
                    $errors = $validator->errors();
                }
            }
        }

        return $this->view->render($response, 'bookshelf/author/edit.twig', [
            'author' => $author,
            'errors' => $errors,
            'csrf' => [
                        'name' => $request->getAttribute('csrf_name'),
                        'value' => $request->getAttribute('csrf_value'),
                      ],
        ]);
    }
}
