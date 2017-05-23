<?php
// DIC configuration
$container = $app->getContainer();

// Database
$container['capsule'] = function ($c) {
    $capsule = new Illuminate\Database\Capsule\Manager;
    $capsule->addConnection($c['settings']['db']);
    return $capsule;
};

// View
$container['view'] = function ($c) {
    $view = new \Slim\Views\Twig($c['settings']['view']['template_path'], $c['settings']['view']['twig']);

    // Add extensions
    $url = preg_replace('/\/\w+\.php$/i', '', rtrim($c->get('request')->getUri(),'/'));
    $view->addExtension(new Slim\Views\TwigExtension($c->get('router'), $url));   
    $view->addExtension(new Twig_Extension_Debug());
    $view->addExtension(new Bookshelf\TwigExtension($c['flash']));

    return $view;
};

// CSRF guard
$container['csrf'] = function ($c) {
    $guard = new \Slim\Csrf\Guard();
    $guard->setFailureCallable(function ($request, $response, $next) {
        $request = $request->withAttribute("csrf_status", false);
        return $next($request, $response);
    });
    return $guard;
};

// Flash messages
$container['flash'] = function ($c) {
    return new \Slim\Flash\Messages;
};

// controller
$container['Bookshelf\AuthorController'] = function ($c) {
    return new Bookshelf\AuthorController($c['view'], $c['router'], $c['flash']);
};

$container['Bookshelf\BookController'] = function ($c) {
    return new Bookshelf\BookController($c['view'], $c['router'], $c['flash']);
};
