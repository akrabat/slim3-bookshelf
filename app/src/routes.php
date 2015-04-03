<?php
// Route configuration

$app->get('/', 'Bookshelf\AuthorController:listAuthors')->SetName('list-authors');
