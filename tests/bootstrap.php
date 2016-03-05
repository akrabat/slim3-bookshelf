<?php

// Set timezone
date_default_timezone_set('Europe/London');

// Prevent session cookies
ini_set('session.use_cookies', 0);


// Enable Composer autoloader
$autoloader = require dirname(__DIR__) . '/vendor/autoload.php';

// Register test classes
$autoloader->addPsr4('AppTest\\', __DIR__);
