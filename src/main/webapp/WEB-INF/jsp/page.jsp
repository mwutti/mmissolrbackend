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

