<%-- 
    Document   : list
    Created on : Aug 28, 2013, 3:30:17 PM
    Author     : yuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fine - ${requestScope.userName}</title>
        <jsp:include page="../partial/resources.html" flush="true" />
    </head>
    <body id="content">
        <jsp:include page="../partial/logo.html" flush="true" />
        <div class="row">
            <div class="blog-entry col-lg-6 col-lg-offset-2">
                <c:forEach items="${requestScope.entries}" var="item" varStatus = "status">
                    <div class="row" id="${item.getId()}">
                        <div class="title">
                            ${item.getTitle()}
                        </div>
                        <div class="blog-body">
                            ${item.getBody()}
                        </div>
                        <div class="votes">
                            <c:choose>
                                    <c:when test="${requestScope.voted[status.index] == false}">
                                        <a href="#" id="${item.getId()}" class="upvote active-link">
                                            <span class="glyphicon glyphicon-heart-empty"></span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="glyphicon glyphicon-heart"></span>
                                    </c:otherwise>
                            </c:choose> 
                            <span class="number">
                                ${item.getRating()}
                            </span>
                        </div>
                    </div>
                </c:forEach>
            <c:if test="${not (requestScope.pages == 0)}">
            <c:forEach begin="1" end="${requestScope.pages}" varStatus="loop">
                <c:choose>
                    <c:when test="${not(loop.current == requestScope.currentPage)}">
                        <a href="${requestScope.nextPageUrl}${loop.current}">${loop.current}</a>
                    </c:when>
                    <c:otherwise>
                         <c:out value="${loop.current}"/>
                    </c:otherwise>
                </c:choose>
            </c:forEach>    
            </c:if>
          </div>
                      <div class="col-lg-4 user-panel">
                <c:choose>
                    <c:when test="${not empty sessionScope.uSessionBean}">
                        ${sessionScope.uSessionBean.getUser().getName()}
                        <div>
                            <a href="/blog">
                                Blog
                            </a>
                        </div>
                        <div>
                            <a href="/new_entry">
                                New post
                            </a>

                        </div>
                        <div>
                            <a href="/settings">
                                Settings
                            </a>
                        </div>
                    </c:when> 
                    <c:otherwise>
                        <div>
                            <a href="/registration">
                                Sign up
                            </a>
                        </div>  
                        <div>
                            <a href="/log_in">
                                Sign in
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>
