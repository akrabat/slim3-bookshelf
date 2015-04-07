<?php
// Route configuration

$app->get('/', 'Bookshelf\AuthorController:listAuthors')->SetName('list-authors');
$app->get('/authors/{author_id:[0-9]+}', 'Bookshelf\AuthorController:listBooks')->SetName('author');
$app->get('/books', 'Bookshelf\BookController:listBooks')->SetName('list-books');
