<?php
namespace Bookshelf;

class TwigExtension extends \Twig_Extension
{
    /**
     * @var \Slim\Flash\Messages
     */
    private $flash;

    public function __construct($flash)
    {
        $this->flash = $flash;
    }

    public function getName()
    {
        return 'bookshelf';
    }

    public function getFunctions()
    {
        return [
            new \Twig_SimpleFunction('alert', [$this, 'alert'], ['is_safe' => ['html']]),
            new \Twig_SimpleFunction('flash_messages', [$this, 'flashMessages'], ['is_safe' => ['html']]),
        ];
    }

    public function flashMessages($messageKey = null, $class = null, $appName = 'default')
    {
        $messages = $this->flash->getMessages();

        $html = '';
        if ($messageKey) {
            if (isset($messages[$messageKey])) {
                $message = implode(", ", $messages[$messageKey]);
                $html .= $this->alert($message, $class);
            }
        } else {
            // if no message key is set, then look for 'message' and 'error'
            if (isset($messages['message'])) {
                $message = implode(", ", $messages['message']);
                $html .= $this->alert($message, 'alert-success', true);
            }
            if (isset($messages['error'])) {
                $message = implode(", ", $messages['error']);
                $html .= $this->alert($message, 'alert-danger');
            }
        }

        return $html;
    }

    public function alert($message, $class = 'alert-danger', $autoFadeout = false)
    {
        $fadeoutClass = $autoFadeout ? 'autofadeout' : '';

        $button = '';
        if (!$autoFadeout) {
            $button = '        <button type="button" class="close" data-dismiss="alert">
            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        </button>
';
        }

        return <<<html
    <div class="alert $class alert-dismissable fade in $fadeoutClass">
        $button
        $message
    </div>
html;
    }
}
