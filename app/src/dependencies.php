<?php
// DIC configuration


// Database
$app['Capsule'] = function ($c) {
    $capsule = new Illuminate\Database\Capsule\Manager;
    $capsule->addConnection($c['settings']['db']);
    return $capsule;
};

// View
$app['View'] = function ($c) {
    $settings = $c['settings']['view'];
    $view = new \Slim\Views\Twig($settings['template_path'], $settings['twig']);

    $twig = $view->getEnvironment();
    $twig->addExtension(new Twig_Extension_Debug());
    
    return $view;
};

// controller
$app['Bookshelf\AuthorController'] = function ($c) {
    return new Bookshelf\AuthorController($c['view']);
};
