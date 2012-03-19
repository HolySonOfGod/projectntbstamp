<%-- 
    Document   : newsCreateNew
    Created on : Oct 14, 2011, 12:36:17 PM
    Author     : PEHA
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

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>News Insert</title>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <p:resources/>
        </head>
        <body>
            <!-- Check administrator logged in or yet -->
            <%
                        Object o = ThaoTacSession.layXuong("MOD");
                        if (o == null) {
                            response.sendRedirect("login.jsp");
                        }
            %>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/s_News.jsp" flush="true"/>
        <section class="grid_12" style="width: 96%;">
            <div class="block-border"><div class="block-content">
                    <h1>News Insert</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel id="main">
                            <h:panelGrid columns="1" style="height:auto">
                                <h:outputLabel value="News Title (*) : " styleClass="khungchu"/>
                                <h:inputText value="#{NewsBC.news.newsTitle}" maxlength="200" size="30"
                                             id="fbt">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputText>
                                <rich:message for="fbt" style="color:red;"/>
                                <h:outputLabel value="News Quote (*) : " styleClass="khungchu"/>
                                <h:inputTextarea value="#{NewsBC.news.newsQuote}" cols="62" rows="5"
                                                 id="fbq">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputTextarea>
                                <rich:message for="fbq" style="color:red;"/>
                                <h:outputLabel value="News Type (*) : " styleClass="khungchu"/>
                                <h:selectOneMenu value="#{NewsBC.newTypeID}" styleClass="outputLabel">
                                    <f:selectItems value="#{NewsBC.listTypeCreate}"/>
                                </h:selectOneMenu>

                                <h:outputLabel value="News Content (*) :  " styleClass="khungchu"/>
                                <h:inputTextarea value="#{NewsBC.news.newsContent}" cols="62" rows="10"
                                                 id="fbc">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputTextarea>
                                <rich:message for="fbc" style="color:red;"/>
                                <h:outputLabel value="News Image (*):" styleClass="khungchu"/>
                                <rich:fileUpload fileUploadListener="#{NewsBC.listener}"
                                                 maxFilesQuantity="1"
                                                 id="upload"
                                                 allowFlash="true" immediateUpload="false"
                                                 acceptedTypes="jpg,gif,png,bmp,jpeg"
                                                 listHeight="50" />

                                <br/><center>
                                    <a4j:commandButton value="            Save              "
                                                       action="#{NewsBC.createNews}"/>
                                </center>

                            </h:panelGrid>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->
    </body>
</html>
</f:view>
