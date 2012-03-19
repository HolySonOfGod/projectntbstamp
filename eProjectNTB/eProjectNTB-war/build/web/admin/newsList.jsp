<%-- 
    Document   : newsList
    Created on : Oct 13, 2011, 10:50:30 AM
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
            <title>News List</title>
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
        <section class="grid_12" style="width: 98%;">
            <div class="block-border"><div class="block-content">
                    <h1>List News</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>                    
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableNewsList" ajaxRendered="true">
                                <rich:dataTable rows="20" id="NewsList" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto;" border="0" var="rowNewsList" value="#{NewsBC.listNews}">
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="News Title" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowNewsList.newsTitle}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="News Quote" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowNewsList.newsQuote}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="News Quote" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowNewsList.newsTypes.typeName}" />
                                    </rich:column>
                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>
                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{NewsBC.setNewsIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowNewsList}" target="#{NewsBC.news}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View News" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{NewsBC.setNewsIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowNewsList}" target="#{NewsBC.news}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update News Type" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{NewsBC.setNewsToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowNewsList}" target="#{NewsBC.news}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete News" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->

        <!--View News Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="300">
            <f:facet name="header">
                <h:outputLabel value="View News Details Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/icon_close.gif" id="closeView"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="viewPanel" attachTo="closeView"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="2">
                        <h:outputLabel style="width:80px;" value="News ID: "/>
                        <h:outputText value="#{rowNewsList.newsID}"/>
                        <h:outputLabel style="width:80px;" value="News Images: "/>
                        <h:graphicImage url="../user/#{rowNewsList.newsImage}" id="icon" alt="#{rowNewsList.newsImage}" style="width: 200px;"/>
                        <h:outputLabel style="width:80px;" value="News Type:" />
                        <h:outputText value="#{rowNewsList.newsTypes.typeName}"/>
                        <h:outputLabel style="width:80px;" value="News Quote: " />
                        <h:outputText value="#{rowNewsList.newsQuote}"/>
                        <h:outputLabel style="width:80px;" value="Content: " />
                        <h:outputText value="#{rowNewsList.newsContent}" style="border: 1px #000 solid; background: #ffffff; width:200px;"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Delete Sure Question When Delete News Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete News Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/delete.png" id="closeDelete" styleClass="hidelink" style="width:18px;height:18px"/>
                    <rich:componentControl for="deletePanel" attachTo="closeDelete" operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <center>
                        <h:outputLabel value="Are you sure to delete this News ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{NewsBC.deleteNews}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update News Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Update News Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/delete.png" id="closeUpdate"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="updatePanel" attachTo="closeUpdate"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">
                            <h:outputLabel value="News ID : " styleClass="khungchu"/>
                            <h:outputLabel value="#{NewsBC.news.newsID}"/>

                            <h:outputLabel value="News title: " styleClass="khungchu"/>
                            <h:inputText value="#{NewsBC.news.newsTitle}" required="true" maxlength="100" size="73"
                                         id="fbt">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="fbt" style="color:red;"/>

                            <h:outputLabel value="News quote: " styleClass="khungchu"/>
                            <h:inputText value="#{NewsBC.news.newsQuote}" required="true" size="73" maxlength="500"
                                         id="fbq">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="fbq" style="color:red;"/>

                            <h:outputLabel value="News image: " styleClass="khungchu"/>
                            <h:inputText value="#{NewsBC.news.newsImage}" required="true" size="73" maxlength="500"/>

                            <h:outputLabel value="News status: " styleClass="khungchu"/>
                            <h:inputText value="#{NewsBC.news.status}" required="true" size="73" maxlength="4"
                                id="fbs">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="fbs" style="color:red;"/>
                            

                            <h:outputLabel value="News Content: " styleClass="khungchu"/>
                            <h:inputTextarea cols="62" rows="8" value="#{NewsBC.news.newsContent}"
                                id="fbc">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="fbc" style="color:red;"/>

                            <h:outputLabel value="News type:  " styleClass="khungchu"/>
                            <rich:comboBox selectFirstOnUpdate="true" valueChangeListener="#{NewsBC.valueChanged}"
                                           defaultLabel="#{NewsBC.news.newsTypes.typeName}" styleClass="outputLabel">
                                <f:selectItems value="#{NewsBC.listNewType}" />
                            </rich:comboBox>
                            <br>
                            <a4j:commandButton value="Update" action="#{NewsBC.updateNews}" reRender="main"
                                               oncomplete="if(#{NewsBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave2"/>

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>
