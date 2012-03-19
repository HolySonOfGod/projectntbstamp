<%--
    Document   : faqView
    Created on : Oct 7, 2011, 2:52:23 PM
    Author     : Nguyen Dang Hoan
--%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich" %>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j" %>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui" %>

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/meta.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
        </head>
        <!--//Noi dung se them vao o day -->
        <body id="page3" onload="new ElementMaxHeight();">
            <jsp:include page="../style/header.jsp" flush="true"/>
            <div class="ndtrai">
                noi dung trai se them sau
            </div>
            <div class="ndphai">
                <!--//Noi dung se them vao o day -->

                <!--//Noi dung se them vao o day -->
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
        </body>
    </html>
</f:view>
