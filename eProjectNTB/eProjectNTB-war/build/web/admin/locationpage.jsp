<%-- 
    Document   : locationpage
    Created on : Oct 7, 2011, 3:12:11 PM
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
            <title>Manage Location Page || Moderator</title>
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
                    <h1>Locations management</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableLocation" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listLocation" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; text-align:center;" border="0" var="rowLocation" value="#{LocationBC.listLocation}">
                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Location" />
                                    </f:facet>
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Location Name" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowLocation.cityName}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Construct Permit Cost" />
                                        </f:facet>
                                        $<h:outputLabel value="#{rowLocation.constructPermitCost}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Occupancy Permit Cost" />
                                        </f:facet>
                                        $<h:outputLabel value="#{rowLocation.occupancyPermitCost}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Country" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowLocation.countries.countryName}"/>
                                    </rich:column>
                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{LocationBC.setLocationIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowLocation}" target="#{LocationBC.location}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Location" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{LocationBC.setLocationIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowLocation}" target="#{LocationBC.location}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Location" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{LocationBC.setLocationToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowLocation}" target="#{LocationBC.location}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Location" />
                                    </rich:column>

                                    <rich:column width="50px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Insert" />
                                        </f:facet>

                                        <a4j:commandLink id="InsertLand"
                                                         oncomplete="#{rich:component('insertLandPanel')}.show()"
                                                         action="#{LandBC.setLocationIDToSession}" value="Land">
                                            <f:setPropertyActionListener value="#{rowLocation.locationID}" target="#{LandBC.locationID}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="InsertLand" value="Insert lands for this location" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Location">
                                </a4j:commandButton>
                                &nbsp;&nbsp;&nbsp;
                                <a4j:commandButton id="GoToLandPage" action="landpage" value="Go to Manage lands"/>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->

        <!--Insert New Land Panel-->
        <rich:modalPanel id="insertLandPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Insert New Land Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeInsertLand"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertLandPanel" attachTo="closeInsertLand"
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
                            <h:inputText style="color:blue;font-weight:bold;" value="#{LandBC.locationID}"/>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{LandBC.createLand}"
                                               oncomplete="if(#{LandBC.errors==0})#{rich:component('insertLandPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--View Location Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="View Location Details Panel" />
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
                        <h:outputLabel style="width:70px;" value="Location ID: "/>
                        <h:outputText style="font-weight:bold;" value="#{LocationBC.location.locationID}"/>
                        <h:outputLabel style="width:70px;" value="City Name: "/>
                        <h:outputText style="font-weight:bold;" value="#{LocationBC.location.cityName}"/>
                        <h:outputLabel style="width:70px;" value="C.P. Cost: " />
                        $<h:outputText style="font-weight:bold;" value="#{LocationBC.location.constructPermitCost}"/>
                        $<h:outputLabel style="width:70px;" value="O.P. Cost: " />
                        <h:outputText style="font-weight:bold;" value="#{LocationBC.location.occupancyPermitCost}"/>
                        <h:outputLabel style="width:70px;" value="Country: " />
                        <h:outputText style="font-weight:bold;" value="#{LocationBC.location.countries.countryName}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Location Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Location Panel"/>
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
                            <h:outputLabel value="City Name (*): " styleClass="khungchu"/>
                            <h:inputText id="txtCityName" value="#{LocationBC.location.cityName}"
                                         required="true" maxlength="100" size="73"
                                         requiredMessage="City can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtCityName" style="color:red;"/>

                            <h:outputLabel value="C.P.Cost (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="C.P.Cost can't be empty" required="true"
                                         id="txtCPC" value="#{LocationBC.location.constructPermitCost}"
                                         size="73" converterMessage="C.P.Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtCPC" style="color:red;"/>

                            <h:outputLabel value="O.P.Cost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="C.P.Cost can't be empty" required="true"
                                         id="txtOPC" value="#{LocationBC.location.occupancyPermitCost}"
                                         size="73" converterMessage="C.P.Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtOPC" style="color:red;"/>

                            <h:outputLabel value="Country:  " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{LocationBC.countryID}">
                                <f:selectItems value="#{LocationBC.listCountryName}"/>
                            </h:selectOneMenu>
                            <h:outputLabel/>

                            <a4j:commandButton value="Insert" action="#{LocationBC.createLocation}" reRender="main"
                                               oncomplete="if(#{LocationBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update Location Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update Location Panel" />
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
                            <h:outputLabel value="City ID:" styleClass="khungchu"/>
                            <h:outputText style="font-weight:bold; color:blue;" value="#{LocationBC.location.locationID}"/>
                            <h:outputLabel/>

                            <h:outputLabel value="City Name (*): " styleClass="khungchu"/>
                            <h:inputText id="txtCityName" value="#{LocationBC.location.cityName}"
                                         required="true" maxlength="100" size="73"
                                         requiredMessage="City can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtCityName" style="color:red;"/>

                            <h:outputLabel value="C.P.Cost (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="C.P.Cost can't be empty" required="true"
                                         id="txtCPC" value="#{LocationBC.location.constructPermitCost}"
                                         size="73" converterMessage="C.P.Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtCPC" style="color:red;"/>

                            <h:outputLabel value="O.P.Cost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="C.P.Cost can't be empty" required="true"
                                         id="txtOPC" value="#{LocationBC.location.occupancyPermitCost}"
                                         size="73" converterMessage="C.P.Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtOPC" style="color:red;"/>

                            <h:outputLabel value="Country:  " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{LocationBC.countryID}">
                                <f:selectItems value="#{LocationBC.listCountryName}"/>
                            </h:selectOneMenu>
                            <h:outputLabel/>

                            <a4j:commandButton value="Update" action="#{LocationBC.updateLocation}" reRender="main"
                                               oncomplete="if(#{LocationBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave2" />

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Delete Sure Question When Delete Location Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Location Panel" />
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
                        <h:outputLabel value="Are you sure to delete this Location ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{LocationBC.deleteLocation}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

    </body>
</html>
</f:view>
