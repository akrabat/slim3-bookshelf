<?php
// DIC configuration
$container = $app->getContainer();

// Database
$container['capsule'] = function ($c) {
    $capsule = new Illuminate\Database\Capsule\Manager;
    $capsule->addConnection($c['settings']['db']);
    return $capsule;
};
// Register the database connection with Eloquent
$capsule = $app->capsule;
$capsule->bootEloquent();


// View
$view = new \Slim\Views\Twig(
    $app->settings['view']['template_path'],
    $app->settings['view']['twig']
);
$view->addExtension(new Twig_Extension_Debug());
$view->addExtension(new \Slim\Views\TwigExtension($app->router, $app->request->getUri()));
$container->register($view);



// controller
$container['Bookshelf\AuthorController'] = function ($c) {
    return new Bookshelf\AuthorController($c['view']);
};

$container['Bookshelf\BookController'] = function ($c) {
    return new Bookshelf\BookController($c['view']);
};
