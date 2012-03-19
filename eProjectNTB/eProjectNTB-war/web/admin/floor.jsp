<%--
    Document   : floor
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
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Manage Floor Page</title>
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
                    <h1>Manage Floor</h1>

                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlFloor" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>

                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableFloor" ajaxRendered="true">
                                <rich:dataTable rows="10" id="listFloor" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto;text-align:center" border="0" var="rowFloor" value="#{FloorBC.listFloor}">

                                    <f:facet name="header">
                                        <rich:columnGroup>
                                            <rich:column>
                                                <h:outputLabel value="FloorID" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Building name" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Floor number"/>
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Number Of Apartment" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Price" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Command" />
                                            </rich:column>
                                        </rich:columnGroup>
                                    </f:facet>


                                    <rich:column style="width:auto;">
                                        <f:facet name="header">
                                            <h:outputLabel value=" " />
                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.floorID}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" filterMethod="#{FloorFilter.filteringFloorByBuildingName}">
                                        <f:facet name="header">
                                            <h:selectOneMenu value="#{FloorFilter.buildingIDFilter}">
                                                <f:selectItem itemLabel="Select a building name" itemValue="0"/>
                                                <f:selectItems value="#{FloorBC.listBuildingName}"/>
                                                <a4j:support event="onchange" reRender="tableFloor;" ajaxSingle="true"/>
                                            </h:selectOneMenu>
                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.buildings.buildingName}" />
                                    </rich:column>


                                    <rich:column style="width:auto;" filterMethod="#{FloorFilter.filteringFloorByFloorNumber}">
                                        <f:facet name="header">
                                            <h:inputText id="FNFilter" value="#{FloorFilter.floorNumber}" required="true" requiredMessage="This field can't be blank">
                                                <a4j:support event="onchange" reRender="tableFloor" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.floorNumber}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" filterMethod="#{FloorFilter.filteringFloorByNOA}">
                                        <f:facet name="header">
                                            <h:inputText id="NOAFilter" value="#{FloorFilter.numberOfApartment}" required="true" requiredMessage="This field can't be blank">
                                                <a4j:support event="onchange" reRender="tableFloor" ajaxSingle="true"/>
                                            </h:inputText>
                       
                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.numberOfApartment}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" filterMethod="#{FloorFilter.filteringFloorByPrice}" >
                                        <f:facet name="header">
                                            <h:inputText id="priceFilter" value="#{FloorFilter.price}" required="true" requiredMessage="This field can't be blank">
                                                <a4j:support event="onchange" reRender="tableFloor" ajaxSingle="true"/>
                                            </h:inputText>
   
                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.price}" />
                                    </rich:column>


                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <a4j:commandLink value="Reset floor table" action="#{FloorFilter.resetFloorTable}" reRender="tableFloor"/>
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{FloorBC.setFloorIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowFloor}" target="#{FloorBC.floor}"/>
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Location" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{FloorBC.updateProcess}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowFloor}" target="#{FloorBC.floor}" />
                                        </a4j:commandLink>
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{FloorBC.setFloorIDToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowFloor}" target="#{FloorBC.floor}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Floors" />


                                    </rich:column>
                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>

                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Floor" style="margin-right:20px">
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
                <h:outputLabel value="View Floors Panel" />
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
                        <h:outputLabel style="width:70px;" value="Floor ID: "/>
                        <h:outputText value="#{FloorBC.floor.floorID}"/>
                        <h:outputLabel style="width:70px;" value="Building: " />
                        <h:outputText value="#{FloorBC.floor.buildings.buildingName}"/>
                        <h:outputLabel style="width:70px;" value="Floor number: "/>
                        <h:outputText value="#{FloorBC.floor.floorNumber}"/>
                        <h:outputLabel style="width:70px;" value="Number Of Apartment: " />
                        <h:outputText value="#{FloorBC.floor.numberOfApartment}"/>
                        <h:outputLabel style="width:70px;" value="Price: " />
                        <h:outputText value="#{FloorBC.floor.price}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert-->
        <rich:modalPanel id="insertPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Floor Panel"/>
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

                        <h:outputLabel value="Building:  " styleClass="khungchu"/>
                        <h:selectOneMenu id="comboBox" value="#{FloorBC.buildingID}" required="true" requiredMessage="Building name can't be blank">
                            <f:selectItem itemLabel="Select building name" />
                            <f:selectItems value="#{FloorBC.listBuildingName}"/>
                            <rich:ajaxValidator event="onblur"/>
                        </h:selectOneMenu>
                        <h:outputLabel/>
                        <rich:message for="comboBox" style="color:red;"/>

                        <h:outputLabel value="Floor number (*): " styleClass="khungchu"/>
                        <h:inputText id="txtFloorNumber" value="#{FloorBC.floor.floorNumber}"
                                     required="true" maxlength="100" size="30"
                                     requiredMessage="Floor number can't be blank" converterMessage="Number Of Apartment must be an integer number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtFloorNumber" style="color:red;"/>

                        <h:outputLabel value="Number Of Apartment(*): " styleClass="khungchu"/>
                        <h:inputText requiredMessage="Number Of Apartment can't be empty" required="true"
                                     id="txtNOA" value="#{FloorBC.floor.numberOfApartment}"
                                     size="30" converterMessage="Number Of Apartment must be an integer number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtNOA" style="color:red;"/>

                        <h:outputLabel value="Price(*): " styleClass="khungchu"/>
                        <h:inputText requiredMessage="Price can't be blank" required="true"
                                     id="txtPrice" value="#{FloorBC.floor.price}" size="30" converterMessage="Price must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtPrice" style="color:red;"/>

                        <a4j:commandButton value="Insert" action="#{FloorBC.createFloor}" reRender="main"
                                           oncomplete="if(#{FloorBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                           styleClass="khungSave3"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!-- Update --->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update Floor Panel" />
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

                        <h:outputLabel value="Building (*):  "  styleClass="khungchu"/>
                        <h:selectOneMenu id="comboBox" value="#{FloorBC.buildingID}" immediate="true" required="true" requiredMessage="Building name can't be blank">
                            <f:selectItems value="#{FloorBC.listBuildingName}"/>
                            <rich:ajaxValidator event="onblur"/>
                        </h:selectOneMenu>
                        <rich:message for="comboBox" style="color:red;"/>

                        <h:outputLabel value="Floor Number (*): "  styleClass="khungchu"/>
                        <h:inputText id="txtFloorNumber" size="30" value="#{FloorBC.floor.floorNumber}" required="true"
                                     requiredMessage="Floor number can't be blank" converterMessage="Floor number must be an integer number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtFloorNumber" style="color:red;"/>

                        <h:outputLabel value="Number Of Apartment (*): "  styleClass="khungchu"/>
                        <h:inputText id="txtNOA" value="#{FloorBC.floor.numberOfApartment}" size="30" required="true"  requiredMessage="Number of Apartment can't be blank" converterMessage="Number of apartment must be an integer number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtNOA" style="color:red;"/>

                        <h:outputLabel value="Price (*): "  styleClass="khungchu"/>
                        <h:inputText id="txtPrice" value="#{FloorBC.floor.price}" size="30" required="true" requiredMessage="Price can't be blank" converterMessage="Price must be a number">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtPrice" style="color:red;"/>

                        <a4j:commandButton value="Update" action="#{FloorBC.updateFloor}" reRender="main"
                                           oncomplete="if(#{FloorBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                           styleClass="khungSave3"/>

                    </h:panelGrid>

                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!--Delete  Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Floor Panel" />
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
                        <h:outputLabel value="Are you sure to delete this Floor ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{FloorBC.deleteFloor}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>