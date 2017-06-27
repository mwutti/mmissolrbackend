<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Presentation</title>
    <style type="text/css">

        #technologies {
            max-height: 550px;
        }


        body {
            width: 100%;
            height: 100%;
        }

        html {
            width: 100%;
            height: 100%;
        }

        @media(min-width:767px) {
            .navbar {
                padding: 20px 0;
                -webkit-transition: background .5s ease-in-out,padding .5s ease-in-out;
                -moz-transition: background .5s ease-in-out,padding .5s ease-in-out;
                transition: background .5s ease-in-out,padding .5s ease-in-out;
            }

            .top-nav-collapse {
                padding: 0;
            }
        }

        /* Demo Sections - You can use these as guides or delete them - the scroller will work with any sort of height, fixed, undefined, or percentage based.
        The padding is very important to make sure the scrollspy picks up the right area when scrolled to. Adjust the margin and padding of sections and children
        of those sections to manage the look and feel of the site. */

        .tech-section {
            height: 100%;
            padding-top: 150px;
            text-align: center;
            background: #fff;
        }

        .proc-section {
            height: 100%;
            padding-top: 150px;
            text-align: center;
            background: #eee;
        }

        .res-section {
            height: 100%;
            padding-top: 150px;
            text-align: center;
            background: #fff;
        }

        .contact-section {
            height: 100%;
            padding-top: 150px;
            text-align: center;
            background: #eee;
        }



    </style>

    <!-- Latest compiled and minified JavaScript -->
    <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <!-- Custom CSS -->
    <link href="resources/css/scrolling-nav.css" rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="resources/js/jquery.bootpag.min.js"></script>
    <script src="resources/js/typeahead.min.js"></script>
    <!-- Scrolling Nav JavaScript -->
    <script src="resources/js/jquery.easing.min.js"></script>
    <script src="resources/js/scrolling-nav.js"></script>

</head>

<!-- The #page-top ID is part of the scrolling feature - the data-spy and data-target are part of the built-in Bootstrap scrollspy function -->

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://localhost:8080">Solr Project</a>
        </div>

        <ul class="nav navbar-nav">
            <li class=""><a href="http://localhost:8080/presentation">Presentation</a></li>
            <li class="page-scroll"><a href="#tech">Technologies</a></li>
            <li class="page-scroll"><a href="#proc">Process</a></li>
            <li class="page-scroll"><a href="#res">ResNet-50</a></li>
        </ul>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Intro Section -->
<section id="tech" class="tech-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 style="margin-bottom:25px">Technologies</h1>
                <img id="technologies" src="http://localhost:8080/technologies.png"/>
            </div>
        </div>
    </div>
</section>

<section id="proc" class="proc-section" style="background: #eeeeee">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 style="margin-bottom:25px">Process Overview</h1>
                <img id="process" src="http://localhost:8080/process.png"/>
            </div>
        </div>
    </div>
</section>

<section id="res" class="res-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 style="">ResNet-50</h1>
                <h2>Pre Trained Deep Learning Model</h2>
                <p>By <a href="http://kaiminghe.com">Kaiming He</a>,<a href="https://scholar.google.com/citations?user=yuB-cfoAAAAJ&amp;hl=en">Xiangyu Zhang</a>,
                    <a href="http://home.ustc.edu.cn/%7Esqren/">Shaoqing Ren</a>, <a href="http://research.microsoft.com/en-us/people/jiansun/">Jian Sun</a>.
                    Microsoft Research Asia (MSRA).</p>
                <div id="labels">

                </div>
            </div>
        </div>
    </div>
</section>

</body>

</html>
