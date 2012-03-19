<%--
    Document   : newsAll
    Created on : Oct 11, 2011, 3:07:04 PM
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

<f:subview id="newsDetailUser">
    <img src="images/psd/detail.png"/>
    <div class="tieudenews">
        <h:outputText value="#{NDB.news.newsTitle}"/>
    </div>
    <div class="newstype">
        News Type : 
        <strong><h:outputText value="#{NDB.news.newsTypes.typeName}"/></strong>
    </div>
    <div class="gioithieu">
        <h:outputText style="color: #787878; font-size: 14px;" styleClass="title" value="#{NDB.news.newsQuote}"/>
    </div>
    <center>
        <h:graphicImage url="#{NDB.news.newsImage}" id="icon" alt="#{NDB.news.newsImage}" style="width: 600px; text-shadow:#990; margin:10px;"/>
    </center>    
    <div class="noidungnews">
        <h:outputText value="#{NDB.news.newsContent}"/>
    </div>
</f:subview>