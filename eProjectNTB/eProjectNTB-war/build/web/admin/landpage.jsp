<%-- 
    Document   : landpage
    Created on : Oct 12, 2011, 8:37:05 PM
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
            <title>Manage Land Page || Moderator</title>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <p:resources/>
        </head>
        <body>
            <!-- Check moderator logged in or yet -->
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
                    <h1>Lands management</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlLand" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>                    
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <h:panelGrid columns="4">
                                <h:outputLabel value="Location: *"/>
                                <h:selectOneMenu value="#{LandBC.locationID}">
                                    <f:selectItems value="#{LandBC.listCityName}"/>
                                </h:selectOneMenu>
                                <a4j:commandButton action="#{LandBC.searchLand}" value="Search" reRender="main"/>
                                <a4j:commandButton action="#{LandBC.showAll}" value="Show All" reRender="main"/>
                                <br/>
                            </h:panelGrid>
                            <a4j:outputPanel id="tableLand" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listLand" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; text-align:center;" border="0" var="rowLand" value="#{LandBC.listLand}">
                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Lands" />
                                    </f:facet>
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Address" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowLand.address}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Area" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowLand.area}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Near by landmark" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowLand.nearByLandmark}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Purchased Cost" />
                                        </f:facet>
                                        $<h:outputLabel value="#{rowLand.purchasedCost}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Present Cost" />
                                        </f:facet>
                                        $<h:outputLabel value="#{rowLand.presentCost}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Purchased date" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowLand.purchasedDate}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Location" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowLand.locations.cityName}"/>
                                    </rich:column>
                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{LandBC.setLandIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowLand}" target="#{LandBC.land}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Land" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{LandBC.setLandIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowLand}" target="#{LandBC.land}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Land" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{LandBC.setLandToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowLand}" target="#{LandBC.land}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Land" />
                                    </rich:column>

                                    <rich:column width="90px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Insert" />
                                        </f:facet>

                                        <a4j:commandLink id="InsertPermit"
                                                         oncomplete="#{rich:component('insertPermitPanel')}.show()"
                                                         action="#{PermitBC.setLandIDToSession}" value="Permit">
                                            <f:setPropertyActionListener value="#{rowLand.landID}" target="#{PermitBC.landID}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="InsertPermit" value="Insert permits for this land" />
                                        &nbsp;&nbsp;&nbsp;
                                        <a4j:commandLink id="InsertBuilding"
                                                         oncomplete="#{rich:component('insertBuildingPanel')}.show()"
                                                         action="#{BuildingBC.setLandIDToSession}" value="Building">
                                            <f:setPropertyActionListener value="#{rowLand.landID}" target="#{BuildingBC.landID}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="InsertBuilding" value="Insert buildings for this land" />                                        
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Land">
                                </a4j:commandButton>
                                &nbsp;&nbsp;&nbsp;
                                <a4j:commandButton id="GoToPermitPage" action="permitpage" value="Go to Manage permits"/>
                                &nbsp;&nbsp;&nbsp;
                                <a4j:commandButton id="GoToBuildingPage" action="buildingpage" value="Go to Manage buildings"/>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->

        <!--Insert New Permit Panel-->
        <rich:modalPanel id="insertPermitPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Permit Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeInsertPermit"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertPermitPanel" attachTo="closeInsertPermit"
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
                                         id="txtIssuer" value="#{PermitBC.permit.issuer}" size="73"
                                         converterMessage="Issuer has maximum 100 characrers">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtIssuer" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Signer (*): " styleClass="khungchu"/>
                            <h:inputText id="txtSigner" value="#{PermitBC.permit.signerName}" maxlength="100"
                                         required="true" requiredMessage="Signer name can't be empty"
                                         converterMessage="Signer has maximum 100 characters" size="73">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtSigner" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="NO. Of Decisions: " styleClass="khungchu"/>
                            <h:inputText value="#{PermitBC.permit.numberOfDecisions}" size="73"/>
                            <h:outputLabel value=""/>

                            <h:outputLabel style="width:100px;" value="Description: " styleClass="khungchu"/>
                            <h:inputText value="#{PermitBC.permit.description}"size="73"/>
                            <h:outputLabel value=""/>

                            <h:outputLabel style="width:100px;" value="Land:  " styleClass="khungchu"/>
                            <h:inputText style="color:blue;font-weight:bold;" value="#{PermitBC.landID}" size="73"/>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{PermitBC.createPermit}"
                                               oncomplete="if(#{PermitBC.errors==0})#{rich:component('insertPermitPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Building Panel-->
        <rich:modalPanel id="insertBuildingPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Building Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeInsertBuilding"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertBuildingPanel" attachTo="closeInsertBuilding"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">
                            <h:outputLabel style="width:100px;" value="Name (*): " styleClass="khungchu"/>
                            <h:inputText id="txtName" value="#{BuildingBC.building.buildingName}"
                                         required="true" requiredMessage="Building Name can't be empty" size="73">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtName" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Area (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Area can't be empty" required="true"
                                         id="txtBArea" value="#{BuildingBC.building.area}"
                                         size="73" converterMessage="Area must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtBArea" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="No. Of Floors (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="No. of floors can't be empty" required="true"
                                         id="txtNoFloor" value="#{BuildingBC.building.numberOfFloor}"
                                         size="73" converterMessage="No. of floors must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtNoFloor" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Date Commencement (*): " styleClass="khungchu"/>
                            <rich:calendar value="#{BuildingBC.building.dateOfCommencement}" style="width:30px;"
                                           converterMessage="Date invalid" required="true" requiredMessage="Date Commencement not null"
                                           showInput="true" enableManualInput="true" id="txtDateX">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="txtDateX" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Date Completion (*): " styleClass="khungchu"/>
                            <rich:calendar value="#{BuildingBC.building.dateOfCompletion}" style="width:30px;"
                                           converterMessage="Date invalid" required="true" requiredMessage="Date Completion not null"
                                           showInput="true" enableManualInput="true" id="txtDateY">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="txtDateY" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Status(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Status can't be empty" required="true"
                                         id="txtStatus" value="#{BuildingBC.building.status}" size="73">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtStatus" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Land:  " styleClass="khungchu"/>
                            <h:inputText style="color:blue;font-weight:bold;" value="#{BuildingBC.landID}" size="73"/>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{BuildingBC.createBuilding}"
                                               oncomplete="if(#{BuildingBC.errors==0})#{rich:component('insertBuildingPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!--View Land Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="250">
            <f:facet name="header">
                <h:outputLabel value="View Land Details Panel" />
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
                        <h:outputLabel style="width:100px;" value="Land ID: "/>
                        <h:outputText style="font-weight:bold;" value="#{LandBC.land.landID}"/>
                        <h:outputLabel style="width:100px;" value="Address: "/>
                        <h:outputText style="font-weight:bold;" value="#{LandBC.land.address}"/>
                        <h:outputLabel style="width:100px;" value="Area: " />
                        <h:outputText style="font-weight:bold;" value="#{LandBC.land.area}"/>
                        <h:outputLabel style="width:100px;" value="Near: " />
                        <h:outputText style="font-weight:bold;" value="#{LandBC.land.nearByLandmark}"/>
                        <h:outputLabel style="width:100px;" value="Purchased Cost: " />
                        <h:outputText style="font-weight:bold;" value="#{LandBC.land.purchasedCost}"/>
                        <h:outputLabel style="width:100px;" value="Present Cost: " />
                        <h:outputText style="font-weight:bold;" value="#{LandBC.land.presentCost}"/>
                        <h:outputLabel style="width:100px;" value="Purchased Date: " />
                        <h:outputText style="font-weight:bold;" value="#{LandBC.land.purchasedDate}"/>
                        <h:outputLabel style="width:100px;" value="Location: " />
                        <h:outputText style="font-weight:bold;" value="#{LandBC.land.locations.cityName}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Land Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Insert New Land Panel"/>
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
                            <h:outputLabel style="width:100px;" value="Address (*): " styleClass="khungchu"/>
                            <h:inputTextarea id="txtAddress" value="#{LandBC.land.address}" cols="62"
                                             required="true" requiredMessage="Address can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="txtAddress" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Area (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Area can't be empty" required="true"
                                         id="txtArea" value="#{LandBC.land.area}"
                                         size="73" converterMessage="Area must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtArea" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Near by landmark (*): " styleClass="khungchu"/>
                            <h:inputTextarea id="txtNBL" value="#{LandBC.land.nearByLandmark}" cols="62"
                                             required="true" requiredMessage="Please input near by landmark for land">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="txtNBL" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Purchased Cost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Purchased Cost can't be empty" required="true"
                                         id="txtPCC" value="#{LandBC.land.purchasedCost}"
                                         size="73" converterMessage="Purchased Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtPCC" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Present Cost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Present Cost can't be empty" required="true"
                                         id="txtPC" value="#{LandBC.land.presentCost}"
                                         size="73" converterMessage="Present Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtPC" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Purchased date: " styleClass="khungchu"/>
                            <rich:calendar  showInput="true" enableManualInput="true" value="#{LandBC.land.purchasedDate}"
                                            id="calPD" converterMessage="Date invalid">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="calPD" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Location:  " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{LandBC.locationID}">
                                <f:selectItems value="#{LandBC.listCityName}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{LandBC.createLand}" reRender="main"
                                               oncomplete="if(#{LandBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update Land Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Update Land Panel" />
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
                            <h:outputLabel style="width:100px;" value="Address (*): " styleClass="khungchu"/>
                            <h:inputTextarea id="txtAddress" value="#{LandBC.land.address}" cols="62"
                                             required="true" requiredMessage="Address can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="txtAddress" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Area (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Area can't be empty" required="true"
                                         id="txtArea" value="#{LandBC.land.area}"
                                         size="73" converterMessage="Area must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtArea" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Near by landmark (*): " styleClass="khungchu"/>
                            <h:inputTextarea id="txtNBL" value="#{LandBC.land.nearByLandmark}" cols="62"
                                             required="true" requiredMessage="Please input near by landmark for land">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="txtNBL" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Purchased Cost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Purchased Cost can't be empty" required="true"
                                         id="txtPCC" value="#{LandBC.land.purchasedCost}"
                                         size="73" converterMessage="Purchased Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtPCC" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Present Cost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Present Cost can't be empty" required="true"
                                         id="txtPC" value="#{LandBC.land.presentCost}"
                                         size="73" converterMessage="Present Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtPC" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Purchased date: " styleClass="khungchu"/>
                            <rich:calendar  showInput="true" enableManualInput="true" value="#{LandBC.land.purchasedDate}"
                                            id="calPD" converterMessage="Date invalid">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="calPD" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Location:  " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{LandBC.locationID}">
                                <f:selectItems value="#{LandBC.listCityName}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Update" action="#{LandBC.updateLand}" reRender="main"
                                               oncomplete="if(#{LandBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave3" />

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Delete Sure Question When Delete Land Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Land Panel" />
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
                        <h:outputLabel value="Are you sure to delete this Land ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{LandBC.deleteLand}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

    </body>
</html>
</f:view>
