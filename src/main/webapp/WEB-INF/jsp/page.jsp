<%--
  Created by IntelliJ IDEA.
  User: Michael
  Date: 25.06.2017
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="result" type="org.springframework.data.solr.core.query.result.SolrResultPage<edu.aau.mmsi.solr.model.ImageResult>" scope="request"/>
<style type="text/css">

    .img-preview {
        width: 150px;
        height: 150px;
        margin: auto auto 30px;
        cursor: pointer;
    }

    #resultOfPageContainer {
        display: flex;
        flex-wrap: wrap;
    }

</style>
<div id="resultOfPageContainer">
    <c:if test="${empty result.content}">
        <h2>No results found!</h2>
    </c:if>
    <c:forEach items="${result.content}" var="image">
        <img class="img-preview" src="${image.url_q}" data-image-id="${image.id}" data-image-o="${image.url_o}"/>

        <div class="modal fade" id="imagemodal-${image.id}" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <img id="imgmodal" src="">
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

