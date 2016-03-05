<?php
// Route configuration

$app->get('/', 'Bookshelf\AuthorController:listAuthors')->setName('list-authors');
$app->map(['GET', 'POST'], '/authors/{author_id:[0-9]+}/edit', 'Bookshelf\AuthorController:editAuthor')
    ->setName('edit-author');
$app->get('/authors/{author_id:[0-9]+}', 'Bookshelf\AuthorController:listBooks')->setName('author');
$app->get('/books', 'Bookshelf\BookController:listBooks')->setName('list-books');
