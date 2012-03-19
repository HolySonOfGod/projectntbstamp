<%-- 
    Document   : rolepage
    Created on : Oct 5, 2011, 12:01:22 PM
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
            <title>Manage Country Page || Moderator</title>
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
                    <h1>Countries management</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlCountry" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>

                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableCountry" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listCountry" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; text-align:center;" border="0" var="rowCountry" value="#{CountryBC.listCountry}">
                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Country" />
                                    </f:facet>
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Country ID" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowCountry.countryID}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Country Name" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowCountry.countryName}" />
                                    </rich:column>

                                    <rich:column width="70px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{CountryBC.setCountryIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowCountry}" target="#{CountryBC.country}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Country" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{CountryBC.setCountryIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowCountry}" target="#{CountryBC.country}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Country" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{CountryBC.setCountryToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowCountry}" target="#{CountryBC.country}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Country" />
                                    </rich:column>
                                    <rich:column width="50px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Insert" />
                                        </f:facet>

                                        <a4j:commandLink id="InsertLocation"
                                                         oncomplete="#{rich:component('insertLocationPanel')}.show()"
                                                         action="#{LocationBC.setCountryIDToSession}" value="Location">
                                            <f:setPropertyActionListener value="#{rowCountry.countryID}" target="#{LocationBC.countryID}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="InsertLocation" value="Insert locations for this country" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new country">
                                </a4j:commandButton>
                                &nbsp;&nbsp;&nbsp;
                                <a4j:commandButton id="GoToLocationPage" action="locationpage" value="Go to Manage locations"/>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->

        <!--Insert New Location Panel-->
        <rich:modalPanel id="insertLocationPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Location Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeInsertLocation"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertLocationPanel" attachTo="closeInsertLocation"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">
                            <h:outputLabel value="City Name (*): " styleClass="khungchu"/>
                            <h:inputText id="txtCityName" value="#{LocationBC.location.cityName}" requiredMessage="City can't be empty"
                                         required="true" maxlength="100" size="30" converterMessage="City name has maximum 100 characters">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtCityName" style="color:red;"/>

                            <h:outputLabel value="C.P.Cost (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="C.P.Cost can't be empty" required="true" id="txtCPC" size="30"
                                         value="#{LocationBC.location.constructPermitCost}" converterMessage="C.P.Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtCPC" style="color:red;"/>

                            <h:outputLabel value="O.P.Cost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="C.P.Cost can't be empty" required="true" id="txtOPC" size="30"
                                         value="#{LocationBC.location.occupancyPermitCost}" converterMessage="C.P.Cost must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtOPC" style="color:red;"/>

                            <h:outputLabel value="Country:  " styleClass="khungchu"/>
                            <h:inputText style="color:blue;font-weight:bold;" value="#{LocationBC.countryID}"/>
                            <h:outputLabel/>

                            <a4j:commandButton value="Insert" action="#{LocationBC.createLocation}"
                                               oncomplete="if(#{LocationBC.errors==0})#{rich:component('insertLocationPanel')}.hide();"
                                               styleClass="khungSave3"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--View Country Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="View Country Details Panel" />
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
                        <h:outputLabel style="width:80px;" value="Country ID :  "/>
                        <h:outputText style="font-weight:bold;" value="#{CountryBC.country.countryID}"/>
                        <h:outputLabel style="width:80px;" value="Country Name :  "/>
                        <h:outputText style="font-weight:bold;" value="#{CountryBC.country.countryName}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Country Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Country Panel"/>
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
                            <h:outputLabel value="Country Name(*) :  " styleClass="khungchu"/>
                            <h:inputText value="#{CountryBC.country.countryName}" maxlength="100" size="30"
                                         id="txtCTName" required="true" requiredMessage="Country name can't be empty"
                                         converterMessage="Country name has maximum 100 characters">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtCTName" style="color:red;"/>

                            <a4j:commandButton value="Insert" action="#{CountryBC.createCountry}" reRender="main"
                                               oncomplete="if(#{CountryBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave3"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update Country Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update Country Panel" />
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
                            <h:outputLabel value="Country ID:" styleClass="khungchu"/>
                            <h:outputText style="font-weight:bold; color:blue;" value="#{CountryBC.country.countryID}"/>
                            <h:outputLabel/>

                            <h:outputLabel value="Country Name(*) :  " styleClass="khungchu"/>
                            <h:inputText value="#{CountryBC.country.countryName}" maxlength="100" size="30"
                                         id="txtCTName" required="true" requiredMessage="Country name can't be empty"
                                         converterMessage="Country name has maximum 100 characters">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtCTName" style="color:red;"/>

                            <a4j:commandButton value="Update" action="#{CountryBC.updateCountry}" reRender="main"
                                               oncomplete="if(#{CountryBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave3" />

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Delete Sure Question When Delete Country Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Country Panel" />
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
                        <h:outputLabel value="Are you sure to delete this country ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{CountryBC.deleteCountry}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>
