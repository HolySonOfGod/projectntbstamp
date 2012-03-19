<%-- 
    Document   : notlogin
    Created on : Oct 22, 2011, 12:14:37 AM
    Author     : Nhat Nguyen
--%>

<%@page import="Helpers.ThaoTacSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Errors Page</title>
            <jsp:include page="style/adminMeta.jsp" flush="true"/>
            <p:resources/>
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>        
        <%
            Object o = ThaoTacSession.layXuong("ADMIN");
            Object o1 = ThaoTacSession.layXuong("MOD");
            String a = ThaoTacSession.layXuong("check").toString();
            if (o != null || o1 != null ) {
                %>
                <jsp:include page="${a}" flush="true"/>
                <%
            }
        %>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border"><div class="block-content">
                    You don't have permission to access this page!
            </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
    </body>
</html>
