<%-- 
    Document   : newsType
    Created on : Oct 11, 2011, 1:02:10 PM
    Author     : Nguyen Dang Hoan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/meta.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
            <title>News</title>
        </head>
        <!--//Noi dung se them vao o day -->
        <body id="page3" onload="new ElementMaxHeight();">
            <jsp:include page="../style/u_News.jsp" flush="true"/>
            <div class="ndtrai">
                <jsp:include page="newsType.jsp" flush="true"/>
                <br/>
                <jsp:include page="feedbackInsert.jsp" flush="true"/>
                <br/><br/>
            </div>
            <div class="ndphai">
                <!--//Noi dung se them vao o day -->                                
                <a4j:include id="contentGuest" viewId="#{navigation.trangNews}"/>
                <!--//Noi dung se them vao o day -->
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
        <a4j:status onstart="#{rich:component('wait')}.show()"
                    onstop="#{rich:component('wait')}.hide()" />
        <rich:modalPanel id="wait" autosized="true" width="230" height="39"
                         moveable="false" resizeable="false">
            <f:facet name="header">
                <h:outputText value="Please wait ... !" />
            </f:facet>
            <h:graphicImage url="images/ajaxloadingbar.gif"  height="19" width="220"/>
        </rich:modalPanel>
    </body>
</html>
</f:view>
