<?php
namespace AppTest\Controller;

use Slim\Http\Environment;
use Slim\Http\Uri;
use Slim\Http\Headers;
use Slim\Http\RequestBody;
use Slim\Http\Request;
use Slim\Http\Response;
use Slim\App;

class AuthorControllerTest extends \PHPUnit_Framework_TestCase
{
    private function createRequest($envData)
    {

    }

    public function testListAuthors()
    {
        $env = Environment::mock([
            'SCRIPT_NAME' => '/index.php',
            'REQUEST_URI' => '/',
            'REQUEST_METHOD' => 'GET',
        ]);

        $uri = Uri::createFromEnvironment($env);
        $headers = Headers::createFromEnvironment($env);
        $cookies = [];
        $serverParams = $env->all();
        $body = new RequestBody();
        $request = new Request('GET', $uri, $headers, $cookies, $serverParams, $body);
        $response = new Response();


        $app = new App();
        $response = $app->process($request, $response);
        var_dump($response);

    }
}
