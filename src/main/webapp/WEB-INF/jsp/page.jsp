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

<div id="page-container">
    <c:if test="${empty result.content}">
        <h2>No results found!</h2>
    </c:if>
    <c:forEach items="${result.content}" var="image">
        <img src="${image.url_q}"/>
    </c:forEach>

</div>

