<%-- 
    Document   : buildingpage
    Created on : Oct 13, 2011, 3:36:37 PM
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
            <title>Manage Building Page || Moderator</title>
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
                    <h1>Buildings management</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlBuilding" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <h:panelGrid columns="4">
                                <h:outputLabel value="Building Name: *"/>
                                <h:inputText value="#{BuildingBC.buildingName}" size="30"/>
                                <a4j:commandButton action="#{BuildingBC.searchBuilding}" value="Search" reRender="main"/>
                                <a4j:commandButton action="#{BuildingBC.showAll}" value="Show All" reRender="main"/>
                                <br/>
                            </h:panelGrid>
                            <a4j:outputPanel id="tableBuilding" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listBuilding" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; text-align:center;" border="0" var="rowBuilding" value="#{BuildingBC.listBuilding}">
                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Buildings" />
                                    </f:facet>
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Building Name" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowBuilding.buildingName}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Area" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowBuilding.area}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="No. of floors" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowBuilding.numberOfFloor}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Date of Commencement" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowBuilding.dateOfCommencement}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Date Of Completion" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowBuilding.dateOfCompletion}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Status" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowBuilding.status}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Land" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowBuilding.lands.landID}"/>
                                    </rich:column>
                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{BuildingBC.setBuildingIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowBuilding}" target="#{BuildingBC.building}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Building" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{BuildingBC.setBuildingIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowBuilding}" target="#{BuildingBC.building}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Building" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{BuildingBC.setBuildingToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowBuilding}" target="#{BuildingBC.building}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Building" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Building">
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
        <!--View Role Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="250">
            <f:facet name="header">
                <h:outputLabel value="View Building Details Panel" />
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
                        <h:outputLabel style="width:100px;" value="Building ID: "/>
                        <h:outputText style="font-weight:bold;" value="#{BuildingBC.building.buildingID}"/>
                        <h:outputLabel style="width:100px;" value="Address: "/>
                        <h:outputText style="font-weight:bold;" value="#{BuildingBC.building.buildingName}"/>
                        <h:outputLabel style="width:100px;" value="Area: " />
                        <h:outputText style="font-weight:bold;" value="#{BuildingBC.building.area}"/>
                        <h:outputLabel style="width:100px;" value="Near: " />
                        <h:outputText style="font-weight:bold;" value="#{BuildingBC.building.numberOfFloor}"/>
                        <h:outputLabel style="width:100px;" value="Purchased Cost: " />
                        <h:outputText style="font-weight:bold;" value="#{BuildingBC.building.dateOfCommencement}"/>
                        <h:outputLabel style="width:100px;" value="Present Cost: " />
                        <h:outputText style="font-weight:bold;" value="#{BuildingBC.building.dateOfCompletion}"/>
                        <h:outputLabel style="width:100px;" value="Purchased Date: " />
                        <h:outputText style="font-weight:bold;" value="#{BuildingBC.building.status}"/>
                        <h:outputLabel style="width:100px;" value="Location: " />
                        <h:outputText style="font-weight:bold;" value="#{BuildingBC.building.lands.landID}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Building Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Building Panel"/>
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
                            <h:outputLabel style="width:100px;" value="Name (*): " styleClass="khungchu"/>
                            <h:inputText id="txtName" value="#{BuildingBC.building.buildingName}"
                                         required="true" requiredMessage="Building Name can't be empty" size="30">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtName" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Area (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Area can't be empty" required="true"
                                         id="txtBAreaB" value="#{BuildingBC.building.area}"
                                         size="30" converterMessage="Area must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtBAreaB" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="No. Of Floors (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="No. of floors can't be empty" required="true"
                                         id="txtNoFloor" value="#{BuildingBC.building.numberOfFloor}"
                                         size="30" converterMessage="No. of floors must be number">
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
                                         id="txtStatus" value="#{BuildingBC.building.status}" size="30">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtStatus" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Land:  " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{BuildingBC.landID}">
                                <f:selectItems value="#{BuildingBC.listLandID}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{BuildingBC.createBuilding}" reRender="main"
                                               oncomplete="if(#{BuildingBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave3"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update Building Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update Building Panel" />
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
                            <h:outputLabel style="width:100px;" value="Building ID: "/>
                            <h:outputLabel style="font-weight:bold; color:blue;" value="#{BuildingBC.building.buildingID}"/>
                            <h:outputLabel value=""/>

                            <h:outputLabel style="width:100px;" value="Name (*): " styleClass="khungchu"/>
                            <h:inputText id="txtName" value="#{BuildingBC.building.buildingName}" 
                                         required="true" requiredMessage="Building can't be empty" size="30">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtName" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Area (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Area can't be empty" required="true"
                                         id="txtArea" value="#{BuildingBC.building.area}"
                                         size="30" converterMessage="Area must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtArea" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="No. Of Floors (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="No. of floors can't be empty" required="true"
                                         id="txtNoFloor" value="#{BuildingBC.building.numberOfFloor}"
                                         size="30" converterMessage="No. of floors must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtNoFloor" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Date Commencement (*): " styleClass="khungchu"/>
                            <rich:calendar value="#{BuildingBC.building.dateOfCommencement}" style="width:30px;"
                                           converterMessage="Date invalid" required="true" requiredMessage="Date Commencemeent not null"
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
                                         id="txtStatus" value="#{BuildingBC.building.status}" size="30">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtStatus" style="color:red;"/>

                            <h:outputLabel style="width:100px;" value="Land:  " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{BuildingBC.landID}">
                                <f:selectItems value="#{BuildingBC.listLandID}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Update" action="#{BuildingBC.updateBuilding}" reRender="main"
                                               oncomplete="if(#{BuildingBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave3" />

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Delete Sure Question When Delete Building Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Building Panel" />
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
                        <h:outputLabel value="Are you sure to delete this Building ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{BuildingBC.deleteBuilding}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

    </body>
</html>
</f:view>

