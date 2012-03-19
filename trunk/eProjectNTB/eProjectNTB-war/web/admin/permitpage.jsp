<%-- 
    Document   : permitpage
    Created on : Oct 13, 2011, 1:11:17 PM
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
            <title>Manage Permit Page</title>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <p:resources/>
        </head>
        <body>
            <!-- Check moderator logged in or yet -->
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
                    <h1>Land's permits management</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlPermit" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tablePermit" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listPermit" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; text-align:center;" border="0" var="rowPermit" value="#{PermitBC.listPermit}">
                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Permits" />
                                    </f:facet>
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Date Issued" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowPermit.dateIssued}" />                                        
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Issuer" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowPermit.issuer}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Signer" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowPermit.signerName}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Number of Decisions" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowPermit.numberOfDecisions}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Status" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowPermit.status}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Description" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowPermit.description}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Land" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowPermit.lands.landID}"/>
                                    </rich:column>
                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{PermitBC.setPermitIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowPermit}" target="#{PermitBC.permit}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Permit" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{PermitBC.setPermitIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowPermit}" target="#{PermitBC.permit}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Permit" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{PermitBC.setPermitToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowPermit}" target="#{PermitBC.permit}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Permit" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Permit">
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
        <!--View Permit Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="250">
            <f:facet name="header">
                <h:outputLabel value="View Permit Details Panel" />
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
                        <h:outputLabel style="width:100px;" value="Permit ID: "/>
                        <h:outputText style="font-weight:bold;" value="#{PermitBC.permit.permitID}"/>
                        <h:outputLabel style="width:100px;" value="Date Issued: "/>
                        <h:outputText style="font-weight:bold;" value="#{PermitBC.permit.dateIssued}"/>
                        <h:outputLabel style="width:100px;" value="Issuer: " />
                        <h:outputText style="font-weight:bold;" value="#{PermitBC.permit.issuer}"/>
                        <h:outputLabel style="width:100px;" value="Signer name: " />
                        <h:outputText style="font-weight:bold;" value="#{PermitBC.permit.signerName}"/>
                        <h:outputLabel style="width:100px;" value="No. Of Decisions: " />
                        <h:outputText style="font-weight:bold;" value="#{PermitBC.permit.numberOfDecisions}"/>
                        <h:outputLabel style="width:100px;" value="Status: " />
                        <h:outputText style="font-weight:bold;" value="#{PermitBC.permit.status}"/>
                        <h:outputLabel style="width:100px;" value="Description: " />
                        <h:outputText style="font-weight:bold;" value="#{PermitBC.permit.description}"/>
                        <h:outputLabel style="width:100px;" value="Land: " />
                        <h:outputText style="font-weight:bold;" value="#{PermitBC.permit.lands.landID}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Permit Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Permit Panel"/>
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
                            <h:outputLabel style="width:100px;" value="Date Issued (*): " styleClass="khungchu"/>
                            <rich:calendar value="#{PermitBC.permit.dateIssued}" 
                                           converterMessage="Date invalid" required="true" requiredMessage="Date not null"
                                           showInput="true" enableManualInput="true" id="txtDate">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="txtDate" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Issuer (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Issuer can't be empty" required="true" maxlength="100"
                                         id="txtIssuer" value="#{PermitBC.permit.issuer}" size="30"
                                         converterMessage="Issuer has maximum 100 characrers">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtIssuer" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Signer (*): " styleClass="khungchu"/>
                            <h:inputText id="txtSigner" value="#{PermitBC.permit.signerName}" maxlength="100"
                                         required="true" requiredMessage="Signer name can't be empty"
                                         converterMessage="Signer has maximum 100 characters" size="30">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtSigner" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="NO. Of Decisions: " styleClass="khungchu"/>
                            <h:inputText value="#{PermitBC.permit.numberOfDecisions}" size="30"/>
                            <h:outputLabel value=""/>

                            <h:outputLabel style="width:100px;" value="Description: " styleClass="khungchu"/>
                            <h:inputText value="#{PermitBC.permit.description}"size="30"/>
                            <h:outputLabel value=""/>

                            <h:outputLabel style="width:100px;" value="Land:  " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{PermitBC.landID}">
                                <f:selectItems value="#{PermitBC.listLandID}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{PermitBC.createPermit}" reRender="main"
                                               oncomplete="if(#{PermitBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave3"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update Permit Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update Permit Panel" />
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
                            <h:outputLabel style="width:100px;" value="Date Issued (*): " styleClass="khungchu"/>
                            <rich:calendar value="#{PermitBC.permit.dateIssued}" style="width:30px;"
                                           converterMessage="Date invalid" required="true" requiredMessage="Date not null"
                                           showInput="true" enableManualInput="true" id="txtDate">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="txtDate" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Issuer (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Issuer can't be empty" required="true" maxlength="100"
                                         id="txtIssuer" value="#{PermitBC.permit.issuer}" size="30"
                                         converterMessage="Issuer has maximum 100 characrers">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtIssuer" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Signer (*): " styleClass="khungchu"/>
                            <h:inputText id="txtSigner" value="#{PermitBC.permit.signerName}" maxlength="100"
                                         required="true" requiredMessage="Signer name can't be empty"
                                         converterMessage="Signer has maximum 100 characters" size="30">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtSigner" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="NO. Of Decisions: " styleClass="khungchu"/>
                            <h:inputText value="#{PermitBC.permit.numberOfDecisions}" size="30"/>
                            <h:outputLabel value=""/>
                            
                            <h:outputLabel style="width:100px;" value="Description: " styleClass="khungchu"/>
                            <h:inputText value="#{PermitBC.permit.description}"size="30"/>
                            <h:outputLabel value=""/>

                            <h:outputLabel style="width:100px;" value="Land: " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{PermitBC.landID}">
                                <f:selectItems value="#{PermitBC.listLandID}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Update" action="#{PermitBC.updatePermit}" reRender="main"
                                               oncomplete="if(#{PermitBC.errors==0})#{rich:component('updatePanel')}.hide();" 
                                               styleClass="khungSave3"/>

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Delete Sure Question When Delete Permit Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Permit Panel" />
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
                        <h:outputLabel value="Are you sure to delete this Permit ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{PermitBC.deletePermit}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

    </body>
</html>
</f:view>

