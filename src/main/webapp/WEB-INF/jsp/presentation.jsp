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
        }

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

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

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
    </div>
</nav>

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
                <btn id="btn-labels" class="btn btn-primary btl-large" style="margin-bottom: 30px">Label Distribution</btn>
                <div id="labels">

                </div>
            </div>
        </div>
    </div>
</section>

<div id="prototype" class="progress" hidden>
    <div class="progress-bar" role="progressbar" aria-valuenow="70"
         aria-valuemin="0" aria-valuemax="100" style="color: #000000;">

    </div>
</div>

<script type="text/javascript">
    $(document).on('ready', function() {
        $('#btn-labels').on('click', function() {
            $.ajax({
                url: "http://localhost:8080/label-data"
            }).done(function(data) {
                var totalCount = data[0]['count'];
                var termVector = data[1];
                var proto= $('#prototype');
                var labelSection = $('#labels')

                var cdv = 0;
                $.each(termVector, function(elem, index) {
                    console.log(index + " " + elem );
                    debugger;
                    var percentage = index / totalCount * 100;
                    cdv = cdv + percentage;


                    var progress = proto.clone();
                    progress.attr('hidden', false);

                    var progressbar = progress.find('.progress-bar');
                    progressbar.attr('aria-valuenow', cdv);
                    progressbar.css('width', cdv + "%")
                    progressbar.html(elem + " , #" + index + ", "+ percentage + "%");

                    progress.prependTo(labelSection)
                })

            })
        })
    })
</script>

</body>

</html>
