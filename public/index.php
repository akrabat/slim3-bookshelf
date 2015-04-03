<?php
// All file paths relative to root
chdir(dirname(__DIR__));

require 'vendor/autoload.php';

if (file_exists('app/settings/settings.php')) {
    $settings = require 'app/settings/settings.php';
} else {
    $settings = require 'app/settings/settings.php.dist';
}

// Instantiate Slim
$app = new \Slim\App($settings);

require 'app/src/dependencies.php';

// Register the database connection with Eloquent
$capsule = $app['Capsule'];
$capsule->bootEloquent();

// Register the view
$app->register($app['View']);


// Register the routes
require 'app/src/routes.php';

$app->run();
