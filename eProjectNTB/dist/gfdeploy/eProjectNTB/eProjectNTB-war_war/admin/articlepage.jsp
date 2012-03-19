<%-- 
    Document   : articlepage
    Created on : Oct 19, 2011, 12:59:33 AM
    Author     : Nhat Nguyen
--%>

<%@page import="Helpers.ThaoTacSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich" %>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j" %>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Manage Article Page</title>
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
            <jsp:include page="../style/s_Selling.jsp" flush="true"/>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border"><div class="block-content">
                    <h1>Articles management</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlArticle" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableArticle" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listArticle" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; text-align:center;" border="0" var="rowArticle" value="#{ArticleBC.listArticle}">
                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Articles" />
                                    </f:facet>
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Title" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowArticle.articleTitle}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Content" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowArticle.articleContent}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Date create" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowArticle.dateCreate}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Status" />
                                        </f:facet>
                                        <h:selectBooleanCheckbox disabled="true" value="#{rowArticle.status}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Writer" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowArticle.accounts.firstName}" />
                                    </rich:column>

                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{ArticleBC.setArticleIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowArticle}" target="#{ArticleBC.article}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Article" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{ArticleBC.setArticleIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowArticle}" target="#{ArticleBC.article}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Article" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{ArticleBC.setArticleToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowArticle}" target="#{ArticleBC.article}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Article" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Article">
                                </a4j:commandButton>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->
        <!--View Article Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="250">
            <f:facet name="header">
                <h:outputLabel value="View Article Details Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeView"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="viewPanel" attachTo="closeView"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="2">
                        <h:outputLabel style="width:100px;" value="Article ID: "/>
                        <h:outputText style="font-weight:bold;" value="#{ArticleBC.article.articleID}"/>
                        <h:outputLabel style="width:100px;" value="Title: "/>
                        <h:outputText style="font-weight:bold;" value="#{ArticleBC.article.articleTitle}"/>
                        <h:outputLabel style="width:100px;" value="Content: " />
                        <h:outputText style="font-weight:bold;" value="#{ArticleBC.article.articleContent}"/>
                        <h:outputLabel style="width:100px;" value="Date Create: " />
                        <h:outputText style="font-weight:bold;" value="#{ArticleBC.article.dateCreate}"/>
                        <h:outputLabel style="width:100px;" value="Status: " />
                        <h:selectBooleanCheckbox disabled="true" style="font-weight:bold;" value="#{ArticleBC.article.status}"/>
                        <h:outputLabel style="width:100px;" value="Apartment: " />
                        <h:outputText style="font-weight:bold;" value="#{ArticleBC.article.apartments.apartmentID}"/>
                        <h:outputLabel style="width:100px;" value="Writer: " />
                        <h:outputText style="font-weight:bold;" value="#{ArticleBC.article.accounts.lastName} #{ArticleBC.article.accounts.firstName}"/>                        
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Article Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Insert New Article Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeInsert"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertPanel" attachTo="closeInsert"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">
                            <h:outputLabel style="width:100px;" value="Title (*): " styleClass="khungchu"/>
                            <h:inputTextarea required="true" requiredMessage="Please input title for article" id="editorTitle"
                                      value="#{ArticleBC.article.articleTitle}"  cols="62" rows="5">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="editorTitle" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Content (*): " styleClass="khungchu"/>
                            <h:inputTextarea required="true" requiredMessage="Please input content for article" id="editorContent"
                                      value="#{ArticleBC.article.articleContent}"  cols="62" rows="5">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="editorContent" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Writer: " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{ArticleBC.username}">
                                <f:selectItems value="#{ArticleBC.listWriter}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <h:outputLabel style="width:100px;" value="Apartment: " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{ArticleBC.apartmentID}">
                                <f:selectItems value="#{ArticleBC.listApartmentID}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{ArticleBC.createArticle}" reRender="main"
                                               oncomplete="if(#{ArticleBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update Article Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Update Article Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeUpdate"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="updatePanel" attachTo="closeUpdate"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">
                            <h:outputLabel style="width:100px;" value="Article ID: " styleClass="khungchu"/>
                            <h:outputText style="font-weight:bold;color:blue;" value="#{ArticleBC.article.articleID}"/>
                            <h:outputLabel/>

                            <h:outputLabel style="width:100px;" value="Title (*): " styleClass="khungchu"/>
                            <h:inputTextarea required="true" requiredMessage="Please input title for article" id="editorTitle"
                                      value="#{ArticleBC.article.articleTitle}"  cols="62" rows="5">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="editorTitle" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Content (*): " styleClass="khungchu"/>
                            <h:inputTextarea required="true" requiredMessage="Please input content for article" id="editorContent"
                                      value="#{ArticleBC.article.articleContent}"  cols="62" rows="5">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="editorContent" style="color:red;"/>
                            
                            <h:outputLabel style="width:100px;" value="Status: " styleClass="khungchu"/>
                            <h:selectBooleanCheckbox value="#{ArticleBC.article.status}" />
                            <h:outputLabel/>

                            <h:outputLabel style="width:100px;" value="Writer: " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{ArticleBC.username}">
                                <f:selectItems value="#{ArticleBC.listWriter}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <h:outputLabel style="width:100px;" value="Apartment: " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{ArticleBC.apartmentID}">
                                <f:selectItems value="#{ArticleBC.listApartmentID}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Update" action="#{ArticleBC.updateArticle}" reRender="main"
                                               oncomplete="if(#{ArticleBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                                styleClass="khungSave2" />

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Delete Sure Question When Delete Article Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Article Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeDelete" styleClass="hidelink" style="width:18px;height:18px"/>
                    <rich:componentControl for="deletePanel" attachTo="closeDelete" operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <center>
                        <h:outputLabel value="Are you sure to delete this Article ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{ArticleBC.deleteArticle}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

    </body>
</html>
</f:view>

