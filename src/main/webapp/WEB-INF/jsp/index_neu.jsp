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

    <title>Scrolling Nav - Start Bootstrap Template</title>
    <style type="text/css">
        .input-group-btn .btn-group {
            display: flex !important;
        }
        .btn-group .btn {
            border-radius: 0;
            margin-left: -1px;
        }
        .btn-group .btn:last-child {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
        }
        .btn-group .form-horizontal .btn[type="submit"] {
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
        }
        .form-horizontal .form-group {
            margin-left: 0;
            margin-right: 0;
        }
        .form-group .form-control:last-child {
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
        }

        #resultOfPageContainer {
            display: flex;
            flex-wrap: wrap;
        }

        .img-preview {
            display: flex !important;
            flex-wrap: wrap;
            /*width: 150px;*/
            /*height: 150px;*/
            /*margin: auto auto auto auto;*/
            cursor: pointer;
        }

        #imgmodal {
            display: flex;
            width: 80%;
            margin:auto;
        }

        #page-selection {
            margin-top:0px;
        }

        #queryInput {
            margin-bottom: 0px;
        }

        .modal-dialog {
            width: 80% !important;
        }

        .figcaption-label1 {
            margin: auto auto 15px;
        }

        .figcaption-labe1-modal {
            margin: auto auto 15px;
            width: 80%;
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
        </ul>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Intro Section -->
<section id="intro" class="intro-section">
    <div class="container">
        <div class="container">
            <form id="queryInput" action="http://localhost:8080/" method="get">
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group" id="adv-search">
                            <input id="querySubmit" type="text" class="form-control" placeholder="Search for keyword" name="searchTerm" value="${searchTerm}" data-provide="typeahead" autocomplete="off"/>
                            <div class="input-group-btn">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div id="pagingRow" class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div id="page-selection" data-pages="${result.totalPages}" data-searchTerm="${searchTerm}"></div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div id="resultOfPageContainer">
                        <c:if test="${empty result.content}">
                            <h2>No results found!</h2>
                        </c:if>
                        <c:forEach items="${result.content}" var="image">
                            <div class="col-xs-2">
                                <img class="img-preview" src="${image.url_q}" data-image-id="${image.id}" data-image-o="${image.url_o}
                            data-image-label1="${image.label1}" data-image-label2="${image.label2}" data-image-label3="${image.label3}"
                                data-image-p1="${image.p1}" data-image-p2="${image.p2}" data-image-p3="${image.p3}"/>
                                <figcaption class="figcaption-label1">${image.label1}</figcaption>
                                <div class="modal fade" id="imagemodal-${image.id}" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <figure>
                                                                <img id="imgmodal" src="">
                                                                <figcaption class="figcaption-labe1-modal">
                                                                    <table class="table">
                                                                        <thead>
                                                                        <tr>
                                                                            <th>Label</th>
                                                                            <th>Accuracy</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <tr>
                                                                            <td>${image.label1}</td>
                                                                            <td>${image.p1}</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>${image.label2}</td>
                                                                            <td>${image.p2}</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>${image.label3}</td>
                                                                            <td>${image.p3}</td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </figcaption>
                                                            </figure>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Scrolling Nav JavaScript -->
<script src="resources/js/jquery.easing.min.js"></script>
<script src="resources/js/scrolling-nav.js"></script>

<script>
    $(document).on('ready', function () {
        var pageSelection = $('#page-selection');
        var totalpages = pageSelection.attr('data-pages');
        var searchTerm = pageSelection.attr('data-searchTerm')

        pageSelection.bootpag({
            total: totalpages,
            page: 1,
            maxVisible: 10
        }).on('page', function(event, num){
            $.ajax({
                url: "http://localhost:8080/page?page=" + (num - 1) + "&" + "searchTerm=" + searchTerm
            }).done(function( data ) {
                var $resultOfPageContainer = $('#resultOfPageContainer');
                $resultOfPageContainer.html(data);
                $resultOfPageContainer.find('img').on('click', function(event) {
                    debugger;
                    var image_id = $(this).attr('data-image-id');
                    var modal = $('#imagemodal-' + image_id);
                    modal.modal('show');
                    modal.find('img').attr('src', $(this).attr('data-image-o'))
                })
            });
        });

        $('img').on('click', function(event) {
            var image_id = $(this).attr('data-image-id');
            var modal = $('#imagemodal-' + image_id);
            modal.modal('show');
            modal.find('img').attr('src', $(this).attr('data-image-o'))

        });

        //Autocompleter js
        $.ajax({
            url: "http://localhost:8080/labels"
        }).done(function(data) {
            $('#querySubmit').typeahead({source: data})
        })
    })


</script>

</body>

</html>
