<?php

/* layout.twig */
class __TwigTemplate_414e402301f1ff590db58286b618e411f73efb0278bb203b5ccac592a09a56ad extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
            'title' => array($this, 'block_title'),
            'nav' => array($this, 'block_nav'),
            'content' => array($this, 'block_content'),
            'javascript' => array($this, 'block_javascript'),
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"utf-8\" >
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">

    <title>";
        // line 8
        $this->displayBlock('title', $context, $blocks);
        echo " &ndash; Bookshelf</title>

    <link rel=\"stylesheet\" href=\"/css/bootstrap.min.css\">
    <link rel=\"stylesheet\" href=\"/css/bootstrap-theme.min.css\">
    <link rel=\"stylesheet\" href=\"/css/style.css\">
    <!--[if lt IE 9]>
      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>
      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>
    <![endif]-->

</head>
<body>

    ";
        // line 21
        $this->displayBlock('nav', $context, $blocks);
        // line 41
        echo "
    <div id=\"layout\" class=\"container\">
        ";
        // line 43
        $this->displayBlock('content', $context, $blocks);
        // line 44
        echo "        
        <footer>
            Source code on GitHub
        </footer>
    </div>



    <script type=\"text/javascript\" src=\"/js/bootstrap.min.js\"></script>
    ";
        // line 53
        $this->displayBlock('javascript', $context, $blocks);
        // line 54
        echo "
</body>
</html>
";
    }

    // line 8
    public function block_title($context, array $blocks = array())
    {
    }

    // line 21
    public function block_nav($context, array $blocks = array())
    {
        // line 22
        echo "    <nav class=\"navbar navbar-inverse navbar-fixed-top\">
      <div class=\"container\">
        <div class=\"navbar-header\">
          <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">
            <span class=\"sr-only\">Toggle navigation</span>
            <span class=\"icon-bar\"></span>
            <span class=\"icon-bar\"></span>
            <span class=\"icon-bar\"></span>
          </button>
          <a class=\"navbar-brand\" href=\"/\">Bookshelf</a>
        </div>
        <div id=\"navbar\" class=\"collapse navbar-collapse\">
          <ul class=\"nav navbar-nav\">
            <li><a href=\"";
        // line 35
        echo twig_escape_filter($this->env, call_user_func_array($this->env->getFunction('url_for')->getCallable(), array("list-authors")), "html", null, true);
        echo " \">Authors</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    ";
    }

    // line 43
    public function block_content($context, array $blocks = array())
    {
    }

    // line 53
    public function block_javascript($context, array $blocks = array())
    {
    }

    public function getTemplateName()
    {
        return "layout.twig";
    }

    public function getDebugInfo()
    {
        return array (  114 => 53,  109 => 43,  99 => 35,  84 => 22,  81 => 21,  76 => 8,  69 => 54,  67 => 53,  56 => 44,  54 => 43,  50 => 41,  48 => 21,  32 => 8,  23 => 1,);
    }
}
