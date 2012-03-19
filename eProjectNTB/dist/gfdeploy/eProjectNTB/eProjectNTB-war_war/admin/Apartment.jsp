<%--
    Document   : Apartment
    Created on : Oct 15, 2011, 9:04:55 AM
    Author     : NguyenHung
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
            <title>Manage Apartment Type Page</title>
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <p:resources/>
        </head>
        <body>
            <%
                        Object o = ThaoTacSession.layXuong("MOD");
                        if (o == null) {
                            response.sendRedirect("login.jsp");
                        }
            %>
            <!-- TEST -->
            <jsp:include page="../style/s_Selling.jsp" flush="true"/>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border"><div class="block-content">
                    <h1>Manage Apartment</h1>

                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlFloor" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>

                    <h:form>
                        <rich:panel style="width:100%;" id="main">
                            <a4j:outputPanel id="tableApartment" ajaxRendered="true">
                                <rich:dataTable rows="10" id="listApartment" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto;text-align:center" border="0" var="rowApartment" value="#{ApartmentBC.listApartment}">

                                    <f:facet name="header">
                                        <rich:columnGroup>
                                            <rich:column>
                                                <h:outputLabel value="ApartmentID" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Apartment type" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Building name" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Floor number"/>
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Area" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Status" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Command" />
                                            </rich:column>
                                        </rich:columnGroup>
                                    </f:facet>

                                    <rich:column style="width:auto">
                                        <f:facet name="header">
                                             <h:outputLabel value=" " />
                                        </f:facet>
                                        <h:outputLabel value="#{rowApartment.apartmentID}"/>
                                    </rich:column>

                                    <rich:column style="width:auto" filterMethod="#{ApartmentFilter.filteringApartmentByType}">
                                        <f:facet name="header">
                                            <h:selectOneMenu value="#{ApartmentFilter.apartmentTypeIDFilter}">
                                                <f:selectItem itemLabel="Select a type" itemValue="0"/>
                                                <f:selectItems value="#{ApartmentBC.listApartmentTypeName}"/>
                                                <a4j:support event="onchange" reRender="tableApartment" ajaxSingle="true"/>
                                            </h:selectOneMenu>
                                        </f:facet>
                                        <h:outputLabel value="#{rowApartment.apartmentTypes.typeName}" />
                                    </rich:column>

                                    <rich:column style="width:auto" filterMethod="#{ApartmentFilter.filteringApartmentByBuildingName}">
                                        <f:facet name="header">
                                            <h:selectOneMenu value="#{ApartmentFilter.buildingIDFilter}">
                                                <f:selectItem itemLabel="Select a building name" itemValue="0"/>
                                                <f:selectItems value="#{ApartmentBC.listBuildingName}"/>
                                                <a4j:support event="onchange" reRender="tableApartment" ajaxSingle="true"/>
                                            </h:selectOneMenu>
                                        </f:facet>
                                        <h:outputLabel value="#{rowApartment.floors.buildings.buildingName}" />
                                    </rich:column>

                                    <rich:column style="width:auto" filterMethod="#{ApartmentFilter.filteringApartmentByFloorNumber}" >
                                        <f:facet name="header">
                                            <h:inputText id="FNFilter" value="#{ApartmentFilter.floorNumber}" required="true" requiredMessage="This field can't be blank">
                                                <a4j:support event="onchange" reRender="tableApartment" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowApartment.floors.floorNumber}" />
                                    </rich:column>


                                    <rich:column style="width:auto" filterMethod="#{ApartmentFilter.filteringApartmentByArea}">
                                        <f:facet name="header">
                                            <h:inputText id="areaFilter" value="#{ApartmentFilter.areaFilter}" required="true" requiredMessage="This field can't be blank">
                                                <a4j:support event="onchange" reRender="tableApartment" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowApartment.area}" />
                                    </rich:column>

                                    <rich:column style="width:auto">
                                        <f:facet name="header">
                                             <h:outputLabel value="" />
                                        </f:facet>
                                        <h:outputLabel rendered="#{rowApartment.status == true}" value="Available"/>
                                        <h:outputLabel rendered="#{rowApartment.status == false}" value="Sold"/>
                                    </rich:column>

                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <a4j:commandLink value="Reset apartment table" action="#{ApartmentFilter.resetApartmentTable}" reRender="tableApartment"/>
                                        </f:facet>
                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{ApartmentBC.setApartmentIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowApartment}" target="#{ApartmentBC.apartment}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Apartment Type" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{ApartmentBC.updateProcess}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowApartment}" target="#{ApartmentBC.apartment}" />
                                        </a4j:commandLink>
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{ApartmentBC.setApartmentToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowApartment}" target="#{ApartmentBC.apartment}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Apartment" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>

                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Apartment">
                                </a4j:commandButton>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>


                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>

        <rich:modalPanel id="viewPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="View Apartment Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/delete.png" id="closeView"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="viewPanel" attachTo="closeView"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="2">
                        <h:outputLabel style="width:200px;" value="ApartmentID: "/>
                        <h:outputText value="#{ApartmentBC.apartment.apartmentID}"/>
                        <h:outputLabel style="width:200px;" value="Building name: " />
                        <h:outputText value="#{ApartmentBC.apartment.floors.buildings.buildingName}"/>
                        <h:outputLabel style="width:200px;" value="Floor number: " />
                        <h:outputText value="#{ApartmentBC.apartment.floors.floorNumber}"/>
                        <h:outputLabel style="width:200px;" value="Apartment type name: " />
                        <h:outputText value="#{ApartmentBC.apartment.apartmentTypes.typeName}"/>
                        <h:outputLabel style="width:200px;" value="Area: " />
                        <h:outputText value="#{ApartmentBC.apartment.area}"/>
                        <h:outputLabel style="width:200px;" value="Sitting Room: "/>
                        <h:outputText value="#{ApartmentBC.apartment.sittingRoom}"/>
                        <h:outputLabel style="width:200px;" value="Bed Room: " />
                        <h:outputText value="#{ApartmentBC.apartment.bedRoom}"/>
                        <h:outputLabel style="width:200px;" value="Bath Room: " />
                        <h:outputText value="#{ApartmentBC.apartment.bathRoom}"/>
                        <h:outputLabel style="width:200px;" value="Kitchen: " />
                        <h:outputText value="#{ApartmentBC.apartment.kitchen}"/>
                        <h:outputLabel style="width:200px;" value="Toilet: " />
                        <h:outputText value="#{ApartmentBC.apartment.toilet}"/>
                        <h:outputLabel style="width:200px;" value="Other properties: " />
                        <h:outputText value="#{ApartmentBC.apartment.otherProperties}"/>
                        <h:outputLabel style="width:200px;" value="Status: " />
                        <h:outputLabel rendered="#{ApartmentBC.apartment.status == true}" value="Available"/>
                        <h:outputLabel rendered="#{ApartmentBC.apartment.status == false}" value="Sold"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert-->
        <rich:modalPanel id="insertPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Apartment Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/delete.png" id="closeInsert"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertPanel" attachTo="closeInsert"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">

                        <h:outputLabel value="Building name:  " styleClass="khungchu"/>
                        <h:selectOneMenu id="building" value="#{ApartmentBC.building.buildingID}" required="true" requiredMessage="This field can't be blank" immediate="true" >
                            <a4j:support event="onchange" action="#{ApartmentBC.buildingIDChanged}" ajaxSingle="true" />
                            <rich:ajaxValidator event="onblur"/>
                            <f:selectItem itemLabel="Select a building name"/>
                            <f:selectItems value="#{ApartmentBC.listBuildingName}"/>
                        </h:selectOneMenu>
                        <rich:message for="building" style="color:red;" styleClass="khungchu"/>

                        <h:outputLabel value="Floor number:  "/>
                        <h:selectOneMenu id="floor" value="#{ApartmentBC.floor.floorID}" required="true" requiredMessage="This field can't be blank" immediate="true">
                            <f:selectItem itemLabel="Select a floor name"/>
                            <f:selectItems value="#{ApartmentBC.listFloorNumber}"/>
                            <rich:ajaxValidator event="onblur"/>
                        </h:selectOneMenu>
                        <rich:message for="floor" style="color:red;" styleClass="khungchu"/>

                        <h:outputLabel value="Apartment type:  "/>
                        <h:selectOneMenu id="apartment" value="#{ApartmentBC.apartmentType.apartmentTypeID}" required="true" requiredMessage="This field can't be blank" immediate="true">
                            <f:selectItem itemLabel="Select an apartment type"/>
                            <f:selectItems value="#{ApartmentBC.listApartmentTypeName}"/>
                            <rich:ajaxValidator event="onblur"/>
                        </h:selectOneMenu>
                        <rich:message for="apartment" style="color:red;"/>

                        <h:outputLabel value="Area(*): " styleClass="khungchu"/>
                        <h:inputText id="txtArea" value="#{ApartmentBC.apartment.area}"
                                     required="true" maxlength="100" size="30"
                                     requiredMessage="Area can't be blank"  converterMessage="Area must be a number">
                        <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtArea" style="color:red;"/>

                        <h:outputLabel value="Sitting room(*): " styleClass="khungchu"/>
                        <h:inputText id="txtSittingRoom" value="#{ApartmentBC.apartment.sittingRoom}"
                                     required="true" maxlength="100" size="30"
                                     requiredMessage="Sitting room can't be blank" converterMessage="Sitting room must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtSittingRoom" style="color:red;"/>

                        <h:outputLabel value="Bed room(*): " styleClass="khungchu"/>
                        <h:inputText id="txtBedRoom" value="#{ApartmentBC.apartment.bedRoom}"
                                     required="true" maxlength="100" size="30"
                                     requiredMessage="Bed room can't be blank" converterMessage="Bed room must be a number" >
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtBedRoom" style="color:red;"/>

                        <h:outputLabel value="Bath room(*): " styleClass="khungchu"/>
                        <h:inputText id="txtBathRoom" value="#{ApartmentBC.apartment.bathRoom}"
                                     required="true" maxlength="100" size="30"
                                     requiredMessage="Bath room can't be blank" converterMessage="Bath room must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtBathRoom" style="color:red;"/>

                        <h:outputLabel value="Kitchen(*): " styleClass="khungchu"/>
                        <h:inputText id="txtKitchen" value="#{ApartmentBC.apartment.kitchen}"
                                     required="true" maxlength="100" size="30"
                                     requiredMessage="Kitchen can't be blank" converterMessage="Kitchen must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtKitchen" style="color:red;"/>

                        <h:outputLabel value="Toilet(*): " styleClass="khungchu"/>
                        <h:inputText id="txtToilet" value="#{ApartmentBC.apartment.toilet}"
                                     required="true" maxlength="100" size="30"
                                     requiredMessage="Toilet can't be blank" converterMessage="Toilet room must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtToilet" style="color:red;"/>

                        <h:outputLabel value="Other Properties(*): " styleClass="khungchu"/>
                        <h:inputTextarea id="txtOP" value="#{ApartmentBC.apartment.otherProperties}" cols="30"
                                     required="true" requiredMessage="Other properties can't be blank" >
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputTextarea>
                        <rich:message for="txtOP" style="color:red;"/>

                        <a4j:commandButton value="Insert" action="#{ApartmentBC.createApartment}" reRender="main"
                                           oncomplete="if(#{ApartmentBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                           styleClass="khungSave3"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!-- Update --->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update Apartment Panel" />
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

                        <h:outputLabel value="Building name: #{ApartmentBC.apartment.floors.buildings.buildingName}" styleClass="khungchu"/>

                        <h:outputLabel value="Floor: " styleClass="khungchu"/>
                        <h:selectOneMenu value="#{ApartmentBC.floor.floorID}">
                            <f:selectItems value="#{ApartmentBC.listFloorNumber}"/>
                        </h:selectOneMenu>

                        <h:outputLabel value="Apartment type: " styleClass="khungchu"/>
                        <h:selectOneMenu value="#{ApartmentBC.apartmentType.apartmentTypeID}">
                            <f:selectItems value="#{ApartmentBC.listApartmentTypeName}"/>
                        </h:selectOneMenu>

                        <h:outputLabel value="Area(*): " styleClass="khungchu"/>
                        <h:inputText id="txtArea" value="#{ApartmentBC.apartment.area}" required="true"  requiredMessage="Area can't be blank" maxlength="100" size="30"
                                             converterMessage="area must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtArea" style="color:red;"/>

                        <h:outputLabel value="Sitting room(*): " styleClass="khungchu"/>
                        <h:inputText id="txtSitting" value="#{ApartmentBC.apartment.sittingRoom}" required="true"  requiredMessage="Sitting room can't be blank" maxlength="100" size="30"
                                     converterMessage="Sitting room must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtSitting" style="color:red;"/>

                        <h:outputLabel value="Bed room(*): " styleClass="khungchu"/>
                        <h:inputText id="txtBed" value="#{ApartmentBC.apartment.bedRoom}" required="true"  requiredMessage="Bed room can't be blank" maxlength="100" size="30"
                                     converterMessage="Bed room must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtBed" style="color:red;"/>

                        <h:outputLabel value="Bath room(*): " styleClass="khungchu"/>
                        <h:inputText id="txtBath" value="#{ApartmentBC.apartment.bathRoom}" required="true"  requiredMessage="Bath room can't be blank" maxlength="100" size="30">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtBath" style="color:red;"/>

                        <h:outputLabel value="Kitchen(*): " styleClass="khungchu"/>
                        <h:inputText id="txtKitchen" value="#{ApartmentBC.apartment.kitchen}" required="true"  requiredMessage="Kitchen can't be blank" maxlength="100" size="30"
                                     converterMessage="Kitchen must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtKitchen" style="color:red;"/>


                        <h:outputLabel value="Toilet(*): " styleClass="khungchu"/>
                        <h:inputText id="txtToilet" value="#{ApartmentBC.apartment.toilet}" required="true"  requiredMessage="Toilet can't be blank" maxlength="100" size="30"
                                     converterMessage="Toilet must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtToilet" style="color:red;"/>

                        <h:outputLabel value="Other Properties(*): " styleClass="khungchu"/>
                        <h:inputTextarea id="txtOther" value="#{ApartmentBC.apartment.otherProperties}" cols="30"
                                     required="true" requiredMessage="Other properties can't be blank" >
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputTextarea>
                        <rich:message for="txtOther" style="color:red;"/>

                        <a4j:commandButton value="Update" action="#{ApartmentBC.updateApartment}" reRender="main"
                                           oncomplete="if(#{ApartmentBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                           styleClass="khungSave3"/>

                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!--Delete  Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Apartment Panel" />
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
                        <h:outputLabel value="Are you sure to delete this Apartment ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{ApartmentBC.deleteApartment}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>