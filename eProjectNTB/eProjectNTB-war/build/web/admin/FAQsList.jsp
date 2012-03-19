<%-- 
    Document   : listFAQs
    Created on : Oct 10, 2011, 10:58:14 PM
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
            <title>List FAQs</title>
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <p:resources/>
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
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
                    <h1>List FAQs</h1>
                    <!--Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableLocation" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listLocation" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; font-size:12px;" border="0" var="rowFAQ" value="#{FAQsBC.listFAQ}">
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Question" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowFAQ.question}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Answer" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowFAQ.answer}" />
                                    </rich:column>

                                    <rich:column width="50px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>                                                                               
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{FAQsBC.setFAQIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowFAQ}" target="#{FAQsBC.FAQ}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update FAQs" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{FAQsBC.setFAQToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowFAQ}" target="#{FAQsBC.FAQ}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete FAQs" />
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

        <!--Update FAQs Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Update FAQs Panel" />
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
                            <a4j:commandButton value="Update" action="#{FAQsBC.updateFAQ}" reRender="main"
                                               oncomplete="if(#{FAQsBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave2"/>

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!--Delete Sure Question When Delete FAQs Panel-->
            <rich:modalPanel id="deletePanel" autosized="true" width="400">
                <f:facet name="header">
                    <h:outputLabel value="Delete FAQs Panel" />
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
                            <h:outputLabel value="Are you sure to delete this FAQs ?"/>
                            <h:panelGrid columns="2" style="text-align:center">
                                <a4j:commandButton size="50" value="Yes" action="#{FAQsBC.deleteFAQ}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                                <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                            </h:panelGrid>
                        </center>
                    </a4j:outputPanel>
                </h:form>
            </rich:modalPanel>
    </body>
</html>
</f:view>
