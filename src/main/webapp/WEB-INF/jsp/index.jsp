<%--
  Created by IntelliJ IDEA.
  User: Michael
  Date: 24.06.2017
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="result" type="org.springframework.data.solr.core.query.result.SolrResultPage<edu.aau.mmsi.solr.model.ImageResult>" scope="request"/>
<jsp:useBean id="searchTerm" type="java.lang.String" scope="request"/>

<html>
<head>
    <title>Solr Project</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="resources/js/jquery.bootpag.min.js"></script>
    <script src="resources/js/typeahead.min.js"></script>

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
            width: 150px;
            height: 150px;
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

        .figcaption-lable1 {
            margin: auto auto 15px;
        }



    </style>
</head>
<body>

<div class="container">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Solr Project</a>
            </div>
        </div>
    </nav>

    <div class="jumbotron">
        <div class="container">
            <form id="queryInput" action="http://localhost:8080/index" method="get">
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
                                <img class="img-preview" src="${image.url_q}" data-image-id="${image.id}" data-image-o="${image.url_o}"/>
                                <figcaption class="figcaption-lable1">${image.label1}</figcaption>
                                <div id="${image.id}" data-image-label1="${image.label1}" data-image-label2="${image.label2}" data-image-label3="${image.label3}"
                                     data-image-p1="${image.p1}" data-image-p2="${image.p2}" data-image-p3="${image.p3}">
                                </div>
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
                                                            <img id="imgmodal" src="">
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

</div>

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
