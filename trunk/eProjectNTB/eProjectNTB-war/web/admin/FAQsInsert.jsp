<%--
    Document   : insertFAQs
    Created on : Oct 10, 2011, 9:46:32 AM
    Author     : Nguyen Dang Hoan
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
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <p:resources/>
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <title>Insert FAQs</title>
        </head>
        <body>
            <!-- Check administrator logged in or yet -->
            <%
                        Object o = ThaoTacSession.layXuong("MOD");
                        if (o == null) {
                            response.sendRedirect("login.jsp");
                        }
            %>
            <jsp:include page="../style/s_FAQs.jsp" flush="true"/>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border"><div class="block-content">
                    <h1>Insert FAQs</h1>
                    <!--Noi dung se them vao o day -->
                    <h:form>
                        <a4j:outputPanel ajaxRendered="true" >
                            <p:growl id="growl" showDetail="true" life="5000" />
                        </a4j:outputPanel>
                        <rich:panel id="main">
                            <h:panelGrid columns="1" style="height:auto">

                                <h:outputLabel value="Question (*) :  " styleClass="khungchu"/>

                                <h:inputTextarea cols="62" rows="8" value="#{FAQsBC.FAQ.question}"
                                                 id="fbq">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputTextarea>
                                <rich:message for="fbq" style="color:red;"/>
                                <h:outputLabel value="Answer :  " styleClass="khungchu"/>

                                <h:inputTextarea cols="62" rows="8" value="#{FAQsBC.FAQ.answer}"
                                                 id="fba">
                                </h:inputTextarea>

                                <center>
                                    <a4j:commandButton value="  Save  " action="#{FAQsBC.createFAQ}" reRender="main" styleClass="khungSave2"  />
                                </center>

                            </h:panelGrid>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
    </body>
</html>
</f:view>
