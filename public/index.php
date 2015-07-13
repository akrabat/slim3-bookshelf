<?php
// All file paths relative to root
chdir(dirname(__DIR__));

require 'vendor/autoload.php';

if (file_exists('app/settings.php')) {
    $settings = require 'app/settings.php';
} else {
    $settings = require 'app/settings.php.dist';
}

// Instantiate Slim
$app = new \Slim\App($settings);

require 'app/src/dependencies.php';

// Register the routes
require 'app/src/routes.php';

$app->run();
