<%--
    Document   : Apartment Type
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
            <script type="text/javascript">
                function setCaretToEnd (e) {
                    var control = $((e.target ? e.target : e.srcElement).id);
                    if (control.createTextRange) {
                        var range = control.createTextRange();
                        range.collapse(false);
                        range.select();
                    }
                    else if (control.setSelectionRange) {
                        control.focus();
                        var length = control.value.length;
                        control.setSelectionRange(length, length);
                    }
                    control.selectionStart = control.selectionEnd = control.value.length;
                }
            </script>
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
                    <h1>Apartment Type</h1>

                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlFloor" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>

                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableApartmentType" ajaxRendered="true">
                                <rich:dataTable rows="10" id="listApartmentType" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto;" border="0" var="rowApartmentType" value="#{ApartmentTypeBC.listApartmentType}">

                                    <f:facet name="header">
                                        <rich:columnGroup>
                                            <rich:column>
                                                <h:outputLabel value="ApartmentTypeID" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Type Name" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Description" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Command"/>
                                            </rich:column>
                                        </rich:columnGroup>
                                    </f:facet>

                                    <rich:column style="width:auto">
                                        <f:facet name="header">
                                             <h:outputLabel value=" " />
                                        </f:facet>
                                        <h:outputLabel value="#{rowApartmentType.apartmentTypeID}"/>
                                    </rich:column>

                                    <rich:column style="width:auto;" filterMethod="#{apartmentTypeFilter.filterType}">
                                        <f:facet name="header">
                                            <h:inputText value="#{apartmentTypeFilter.typeName}">
                                                <a4j:support event="onkeyup" reRender="tableApartmentType" ignoreDupResponses="true"
                                                             oncomplete="setCaretToEnd(event);"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowApartmentType.typeName}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" filterMethod="#{apartmentTypeFilter.filterDescription}">
                                        <f:facet name="header">
                                            <h:outputLabel value="" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowApartmentType.description}" />
                                    </rich:column>

   

                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="" />
                                        </f:facet>
                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{ApartmentTypeBC.setApartmentTypeIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowApartmentType}" target="#{ApartmentTypeBC.apartmentType}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Apartment Type" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{ApartmentTypeBC.setApartmentTypeIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowApartmentType}" target="#{ApartmentTypeBC.apartmentType}" />
                                        </a4j:commandLink>
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{ApartmentTypeBC.setApartmentTypeIDToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowApartmentType}" target="#{ApartmentTypeBC.apartmentType}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Apartment Type" />

                                    </rich:column>
                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>

                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Apartment Type">
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
                <h:outputLabel value="View Apartment Type Panel" />
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
                        <h:outputLabel style="width:70px;" value="Type name: "/>
                        <h:outputText value="#{ApartmentTypeBC.apartmentType.typeName}"/>
                        <h:outputLabel style="width:70px;" value="Description:" />
                        <h:outputText value="#{ApartmentTypeBC.apartmentType.description}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert-->
        <rich:modalPanel id="insertPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Insert New Apartment Type Panel"/>
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
                        <h:outputLabel value="Type name(*): " styleClass="khungchu"/>
                        <h:inputText id="txtTypeName" value="#{ApartmentTypeBC.apartmentType.typeName}"
                                     required="true" maxlength="100" size="73"
                                     requiredMessage="Type name can't be empty">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtTypeName" style="color:red;"/>

                        <h:outputLabel value="Description(*): " styleClass="khungchu"/>
                        <h:inputTextarea cols="62" rows="8" requiredMessage="Description can't be empty" required="true"
                                         id="txtDescription" value="#{ApartmentTypeBC.apartmentType.description}" >
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputTextarea>
                        <rich:message for="txtDescription" style="color:red;"/>
                        <a4j:commandButton value="Insert" action="#{ApartmentTypeBC.createApartmentType}" reRender="main"
                                           oncomplete="if(#{ApartmentTypeBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                           styleClass="khungSave2"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!-- Update --->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Update Apartment Type Panel" />
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
                        <h:outputLabel value="Type Name(*): " styleClass="khungchu"/>
                        <h:inputText value="#{ApartmentTypeBC.apartmentType.typeName}" required="true" maxlength="100" size="73">
                            <rich:beanValidator summary="Message"/>
                        </h:inputText>
                        <h:outputLabel value="Description(*): " styleClass="khungchu"/>
                        <h:inputTextarea cols="62" rows="8" requiredMessage="Description can't be empty" required="true"
                                         id="txtDescription" value="#{ApartmentTypeBC.apartmentType.description}" >
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputTextarea>

                        <a4j:commandButton value="Update" action="#{ApartmentTypeBC.updateApartmentType}" reRender="main"
                                           oncomplete="if(#{ApartmentTypeBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                           styleClass="khungSave2" />

                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!--Delete  Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Apartment Type Panel" />
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
                        <h:outputLabel value="Are you sure to delete this Apartment Type ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{ApartmentTypeBC.deleteApartmentType}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>