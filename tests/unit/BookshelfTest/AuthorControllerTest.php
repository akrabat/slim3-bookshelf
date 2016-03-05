<?php
namespace BookshelfTest;

use Bookshelf\AuthorController;
use Slim\Views\Twig;
use Slim\Router;
use Slim\Flash\Messages as FlashMessages;
use Bookshelf\AuthorRepository;
use Slim\Http\Environment;
use Slim\Http\Request;
use Slim\Http\Response;
use Illuminate\Database\Eloquent\Collection;
use Bookshelf\Author;

class AuthorControllerTest extends \PHPUnit_Framework_TestCase
{
    public function setUp()
    {
        // mocks for controller dependencies (constructor arguments)
        $this->view = $this->getMockBuilder(Twig::class)
            ->setMethods(['render'])
            ->disableOriginalConstructor()
            ->getMock();

        $this->router = $this->getMockBuilder(Router::class)
            ->setMethods(['pathFor'])
            ->disableOriginalConstructor()
            ->getMock();

        $this->flash = $this->getMockBuilder(FlashMessages::class)
            ->setMethods(['addMessage'])
            ->disableOriginalConstructor()
            ->getMock();

        $this->authorRepository = $this->getMockBuilder(AuthorRepository::class)
            ->setMethods(['all', 'find'])
            ->disableOriginalConstructor()
            ->getMock();
    }

    /**
     * Test the listAuthors controller action.
     *
     */
    public function testListAuthors()
    {
        // we expect authorRepository::find() to be called and return a collection
        $authorsCollection = new Collection([
            new Author(['name' => 'test1']),
            new Author(['name' => 'test2']),
            new Author(['name' => 'test3']),
        ]);
        $this->authorRepository->expects($this->once())
            ->method('all')
            ->willReturn($authorsCollection);

        // we expect view::render() to be called with a response, template name & data
        // and for it to return a response with a string of some sort
        $response = new Response();
        $templateName = 'bookshelf/author/list.twig';
        $response->write('rendered text on page');

        $this->view->expects($this->once())
            ->method('render')
            ->with($response, $templateName, ['authors' => $authorsCollection])
            ->willReturn($response);

        // instantiate the controller with its dependencies
        $controller = new AuthorController($this->view, $this->router, $this->flash, $this->authorRepository);

        // We need a request object for our controller action
        $environment = Environment::mock(['REQUEST_URI' => '/']);
        $request = Request::createFromEnvironment($environment);

        // run the controller action
        $response = $controller->listAuthors($request, $response);

        // ensure that the response has the data we expect
        $this->assertSame((string)$response->getBody(), 'rendered text on page');
    }
}
