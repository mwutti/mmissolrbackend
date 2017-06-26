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
</head>
<body>
<div class="container">
    <!-- Static navbar -->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Project name</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">Nav header</li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>
                    <li><a href="../navbar-static-top/">Static top</a></li>
                    <li><a href="../navbar-fixed-top/">Fixed top</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </nav>

    <!-- Main component for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>Navbar example</h1>

        <form id="queryInput" onsubmit="return renderElements()">
            <div class="form-group">
                <label for="tag">Enter query terms here:</label>
                <input type="text" class="form-control" id="tag">
            </div>
            <button type="submit" class="btn btn-default">Get Results</button>
        </form>

        <div id="content"></div>
        <div id="page-selection" data-pages="${result.totalPages}"></div>

        <div id="resultofPageContainer">

        </div>
    </div>

</div>

<script>
    function renderElements() {
        var pageSelection = $('#page-selection');
        var totalpages = pageSelection.attr('data-pages');
        var searchTerm = document.getElementById("tag").value;



        <%--pageSelection.bootpag({--%>
            <%--total: totalPages,--%>
            <%--maxVisible: 10--%>
        <%--}).on("page", function(event, num){--%>
            <%--<c:forEach items="${result.content}" var="image">--%>
            <%--$("#content").append('<img src="${image.url_q}"/>');--%>
            <%--</c:forEach>--%>
        <%--});--%>

        $.ajax({
            url: "http://localhost:8080/page?page=" + 0 + "&" + "searchTerm=" + searchTerm
        }).done(function(data) {
            $('#resultofPageContainer').html(data);
        })

        $('#page-selection').bootpag({
            total: totalpages,
            page: 1,
            maxVisible: 10
        }).on('page', function(event, num){
            $.ajax({
                url: "http://localhost:8080/page?page=" + (num - 1) + "&" + "searchTerm=" + searchTerm
            }).done(function( data ) {

                $('#resultofPageContainer').html(data);
                $('#page-selection').bootpag({total: 10, maxVisible: 5});
            });
        });
        return false;
    }

</script>

</body>
</html>
