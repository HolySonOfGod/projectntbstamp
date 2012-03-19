<%--
    Document   : paymentmode
    Created on : Oct 7, 2011, 3:12:11 PM
    Author     : phamdoan
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
            <title>Manage Payment mode</title>
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
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
            <jsp:include page="../style/s_Contract.jsp" flush="true"/>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border">
                <div class="block-content">
                    <h1>Payment Details</h1>
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableLocation" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listLocation" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto;" border="0" var="rowMode" value="#{PaymentModeBC.listPaymentMode}">
                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Payment Modes" />
                                    </f:facet>
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Payment Mode Name" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowMode.paymentModeName}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Installment" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowMode.installment}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="interest/1 month" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowMode.interest}" />
                                    </rich:column>
                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>
                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{PaymentModeBC.setPaymentModeIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowMode}" target="#{PaymentModeBC.paymentMode}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Payment mode" />
                                        <!---
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{PaymentModeBC.setPaymentModeIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowMode}" target="#{PaymentModeBC.paymentMode}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Location" />
                                         -->
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{PaymentModeBC.setPaymentModeIDToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowMode}" target="#{PaymentModeBC.paymentMode}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Payment Mode" />                                      
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Payment Mode">
                                </a4j:commandButton>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>

                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>

        <!--View Payment Modes-->
        <rich:modalPanel id="viewPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="View Location Details Panel" />
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
                        <h:outputLabel style="width:70px;" value="Location ID: "/>
                        <h:outputText value="#{PaymentModeBC.paymentMode.paymentModeID}"/>
                        <h:outputLabel style="width:70px;" value="City Name: "/>
                        <h:outputText value="#{PaymentModeBC.paymentMode.paymentModeName}"/>
                        <h:outputLabel style="width:70px;" value="C.P. Cost: " />
                        <h:outputText value="#{PaymentModeBC.paymentMode.installment}"/>
                        <h:outputLabel style="width:70px;" value="O.P. Cost: " />
                        <h:outputText value="#{PaymentModeBC.paymentMode.interest}"/>
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
                    <h:graphicImage value="images/delete.png" id="closeInsert"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertPanel" attachTo="closeInsert"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">
                            <h:outputLabel value="Mode name (*): " styleClass="khungchu"/>
                            <h:inputText id="txtmodeName" value="#{PaymentModeBC.paymentMode.paymentModeName}"
                                         required="true" maxlength="100" size="30"
                                         requiredMessage="Mode name can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtmodeName" style="color:red;"/>

                            <h:outputLabel value="Installment(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Installment can't be empty" required="true"
                                         id="txtInstallment" value="#{PaymentModeBC.paymentMode.installment}"
                                         size="30" converterMessage="Installment must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtInstallment" style="color:red;"/>

                            <h:outputLabel value="interest(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage=" interest can't be empty" required="true"
                                         id="txtInterest" value="#{PaymentModeBC.paymentMode.interest}"
                                         size="30" converterMessage="interest must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtInterest" style="color:red;"/>

                            <a4j:commandButton value="Insert" action="#{PaymentModeBC.createPaymentMode}" reRender="main"
                                               oncomplete="if(#{PaymentModeBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                                styleClass="khungSave3"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update payment mode Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update Location Panel" />
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
                            <h:outputLabel value="Payment Mode Name (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage=" payment mode name can't be empty" value="#{PaymentModeBC.paymentMode.paymentModeName}" required="true" maxlength="100" size="30">
                                <rich:beanValidator summary="Message"/>
                            </h:inputText>
                            <h:outputLabel value="Installment (*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage=" installment can't be empty" value="#{PaymentModeBC.paymentMode.installment}" required="true" size="30" converterMessage="interest must be number"/>

                            <h:outputLabel value="Interest(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage=" interest can't be empty" value="#{PaymentModeBC.paymentMode.interest}" required="true" size="30" converterMessage="interest must be number"/>

                            <a4j:commandButton value="Update" action="#{PaymentModeBC.updatePaymentMode}" reRender="main"
                                               oncomplete="if(#{PaymentModeBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                                styleClass="khungSave3" />

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
                    <h:graphicImage value="images/delete.png" id="closeDelete" styleClass="hidelink" style="width:18px;height:18px"/>
                    <rich:componentControl for="deletePanel" attachTo="closeDelete" operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <center>
                        <h:outputLabel value="Are you sure to delete this Payment Modes ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{PaymentModeBC.deletePaymentMode}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>
