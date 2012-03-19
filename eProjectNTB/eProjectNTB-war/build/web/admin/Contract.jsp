<%--
    Document   : Contract
    Created on : Oct 16, 2011, 11:00:08 PM
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
            <title>Manage Contract</title>
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
            <jsp:include page="../style/s_Contract.jsp" flush="true"/>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border">
                <div class="block-content">
                    <h1>Contract</h1>
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableContract" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listLocation" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto;" border="0" var="rowContract" value="#{ContractBC.listContract}">


                                    <f:facet name="header">
                                        <rich:columnGroup>
                                            <rich:column>
                                                <h:outputLabel value="No." />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="UserName" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Date Create" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="StampDutyCost" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Apartment Price"/>
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="TotalCost" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="FirstPaid" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="PaymentModes Name" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Apartment ID" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Command" />
                                            </rich:column>
                                        </rich:columnGroup>
                                    </f:facet>

                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{contractFilter.filterStates}">
                                        <f:facet name="header">
                                            <h:inputText value="#{contractFilter.username}">
                                                <a4j:support event="onkeyup" reRender="tableContract" ignoreDupResponses="true"
                                                             oncomplete="setCaretToEnd(event);"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowContract.accounts.username}" style="width: 120px;"/>
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{contractFilter.filterByDate}">
                                        <f:facet name="header">
                                            <h:panelGroup>
                                                <rich:calendar value="#{contractFilter.filterDate}" id="dateFilter" datePattern="MM/dd/yyyyy">
                                                    <a4j:support ajaxSingle="true" event="onchanged" reRender="tableContract"/>
                                                    
                                                </rich:calendar>
                                            </h:panelGroup>
                                        </f:facet>
                                        <h:outputLabel value="#{rowContract.dateCreate}" >
                                            <f:convertDateTime dateStyle="default" pattern="MM/dd/yyyy"/>
                                        </h:outputLabel>
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{contractFilter.filteringStampDutyCost}">
                                        <f:facet name="header">
                                            <h:inputText value="#{contractFilter.stampDutyCost}" converterMessage="StampDuty Cost is number" required="true" requiredMessage="This field can't be blank" style="width: 120px;">
                                                <a4j:support event="onchange" reRender="tableContract" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowContract.stampDutyCost}"/>
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{contractFilter.filteringApartmentPrice}">
                                        <f:facet name="header">
                                            <h:inputText value="#{contractFilter.apartmentPrice}" required="true" requiredMessage="This field can't be blank" style="width: 120px;">
                                                <a4j:support event="onchange" reRender="tableContract" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowContract.apartmentPrice}"/>
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{contractFilter.filteringTotalCost}">
                                        <f:facet name="header">
                                            <h:inputText value="#{contractFilter.totalCost}" required="true" requiredMessage="This field can't be blank" style="width: 120px;">
                                                <a4j:support event="onchange" reRender="tableContract" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowContract.totalCost}"/>
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{contractFilter.filteringfirstPaid}">
                                        <f:facet name="header">
                                            <h:inputText value="#{contractFilter.firstPaid}" required="true" requiredMessage="This field can't be blank" style="width: 120px;">
                                                <a4j:support event="onchange" reRender="tableContract" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowContract.firstPaid}"/>
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{contractFilter.filteringPaymentmodeName}">
                                        <f:facet name="header">
                                            <h:selectOneMenu value="#{contractFilter.paymentModeID}">
                                                <f:selectItem itemLabel="Select a payment mode name" itemValue="0"/>
                                                <f:selectItems value="#{ContractBC.listPaymodeID}"/>
                                                <a4j:support event="onchange" reRender="tableFloor;" ajaxSingle="true"/>
                                            </h:selectOneMenu>
                                        </f:facet>
                                        <h:outputLabel value="#{rowContract.paymentModes.paymentModeName}"/>
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{contractFilter.filteringApartmentID}">
                                        <f:facet name="header">
                                            <h:inputText value="#{contractFilter.apartmentID}" required="true" requiredMessage="This field can't be blank" style="width: 120px;">
                                                <a4j:support event="onchange" reRender="tableContract" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowContract.apartments.apartmentID}"/>
                                    </rich:column>
                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <a4j:commandLink value="Reset table" action="#{contractFilter.resetContractTable}" reRender="tableContract"/>
                                        </f:facet>
                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{ContractBC.setContractIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowContract}" target="#{ContractBC.contract}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Contract" />
                                        <!--
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{ContractBC.setContractIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowContract}" target="#{ContractBC.contract}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Contract" />
                                        -->
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{ContractBC.setContractIDToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowContract}" target="#{ContractBC.contract}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Contract Mode" />
                                    </rich:column>
                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Contract">
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
                    <h:graphicImage value="/images/delete.png" id="closeView"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="viewPanel" attachTo="closeView"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="2">
                        <h:outputLabel style="width:70px;" value="Contract ID :" styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.contractID}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="Username :" styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.accounts.username}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="First Name :" styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.accounts.firstName}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="Phone :" styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.accounts.phone}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="Email :" styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.accounts.email}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="Payment Mode Name :" styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.paymentModes.paymentModeName}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="Date Create : " styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.dateCreate}" styleClass="khungchu">
                            <f:convertDateTime pattern="MM/dd/yyyy"/>
                        </h:outputText>
                        <h:outputLabel style="width:70px;" value="StampDutyCost : " styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.stampDutyCost}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="ApartmentPrice :" styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.apartmentPrice}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="TotalCost : " styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.totalCost}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="FirstPaid : " styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.firstPaid}" styleClass="khungchu"/>
                        <h:outputLabel style="width:70px;" value="ApartmentID :" styleClass="khungchu"/>
                        <h:outputText value="#{ContractBC.contract.apartments.apartmentID}" styleClass="khungchu"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
        <!--Insert  Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert Contract Panel"/>
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
                <a4j:outputPanel ajaxRendered="true" layout="block">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">
                            <h:outputLabel value="Account Name: "/>
                            <h:selectOneMenu id="username" value="#{ContractBC.username}" required="true" immediate="true" style="width: 200px;" requiredMessage="User Name can't be blank">
                                <f:selectItem itemLabel="Select a Account name"/>
                                <f:selectItems value="#{ContractBC.listAccount}"/>
                                <rich:ajaxValidator event="onblur"/>
                            </h:selectOneMenu>
                            <rich:message for="username" style="color:red;" styleClass="khungchu"/>

                            <h:outputLabel value="Apartment ID:  " styleClass="khungchu"/>
                            <h:selectOneMenu id="apartment" immediate="true" value="#{ContractBC.apartmentId}" required="true" style="width: 200px;" requiredMessage="User Name can't be blank">
                                <f:selectItem itemLabel="Select an apartment"/>
                                <f:selectItems value="#{ContractBC.listApartment}"/>
                                <rich:ajaxValidator event="onblur"/>
                                <a4j:support event="onchange" action="#{ContractBC.apartmentChanged}" ajaxSingle="true"/>
                            </h:selectOneMenu>
                            <rich:message for="apartment" style="color:red;"/>
                            <br/>
                            <h:outputLabel value="Area : " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.area}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <h:outputText/>
                            <br/>
                            <h:outputLabel value="Price: " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.price}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <h:outputText/>
                            <br/>
                            <h:outputLabel value="Apartment Price: " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.apartmentPrice}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <br/>
                            <h:outputLabel value="stampDutyCost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage=" interest can't be empty" required="true" style="width: 200px;"
                                         id="txtStamp" value="#{ContractBC.stampDutyCost}"
                                         size="30" converterMessage="interest must be number <= 3.000">
                                <a4j:support event="onchange" action="#{ContractBC.dmStamp}" ajaxSingle="true"/>
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtStamp" style="color:red;"/>

                            <h:outputLabel value="Payment Mode Name :" styleClass="khungchu"/>
                            <h:selectOneMenu id="menuModeID" value="#{ContractBC.paymentModeID}" style="width:200px" rendered="true" requiredMessage="User Name can't be blank">
                                <f:selectItem itemLabel="Select a Payment Mode"/>
                                <f:selectItems id="iTemID" value="#{ContractBC.listPaymodeID}"/>
                                <rich:ajaxValidator event="onblur"/>
                                <a4j:support event="onchange" action="#{ContractBC.paymentChanged}" ajaxSingle="true"/>
                            </h:selectOneMenu>

                            <h:outputLabel value="Interest: " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.paymentmode.interest}"/>
                            </h:outputLabel>
                            <h:outputLabel value="First Paid(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage=" interest can't be empty" required="true" style="width: 200px;"
                                         id="txtfirstPaid" value="#{ContractBC.contract.firstPaid}"
                                         size="30" converterMessage="interest must be number">
                                <a4j:support event="onchange" action="#{ContractBC.firstPaidChanged}" ajaxSingle="true"/>
                            </h:inputText>
                            <rich:message for="txtfirstPaid" style="color:red;"/>

                            <h:outputLabel value="Total Cost(*): " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.contract.totalCost}"/>
                            </h:outputLabel>
                            <br/>
                            <a4j:commandButton value="Insert" action="#{ContractBC.createContract}" reRender="main"
                                               oncomplete="if(#{ContractBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave3"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
        <!--Update Contract-->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update" />
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
                            <h:outputLabel value="Apartment ID:  " styleClass="khungchu"/>
                            <h:outputText value="#{ContractBC.contract.apartments.apartmentID}"/>
                            <rich:message for="apartment" style="color:red;"/>
                            <h:outputText/>
                            <br/>
                            <h:outputLabel value="Area : " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.contract.apartments.area}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <h:outputText/>
                            <br/>
                            <h:outputLabel value="Price: " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.contract.apartments.floors.price}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <h:outputText/>
                            <br/>
                            <h:outputLabel value="Apartment Price: " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.contract.apartmentPrice}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <br/>
                            <h:outputLabel value="stampDutyCost(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage=" interest can't be empty" required="true"
                                         id="txtStamp" value="#{ContractBC.contract.stampDutyCost}"
                                         size="30" converterMessage="interest must be number < 3000">
                                <a4j:support event="onchange" action="#{ContractBC.dmStamp}" ajaxSingle="true"/>
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtStamp" style="color:red;"/>

                            <h:outputLabel value="Payment Mode Name :" styleClass="khungchu"/>
                            <h:selectOneMenu id="menuModeID" value="#{ContractBC.paymentModeID}" style="width:150px">
                                <f:selectItems id="iTemID" value="#{ContractBC.listPaymodeID}"/>
                                <a4j:support event="onchange" action="#{ContractBC.paymentChanged}" ajaxSingle="true"/>
                            </h:selectOneMenu>

                            <h:outputLabel value="Interest: " styleClass="khungchu"/>
                            <h:outputLabel value="#{ContractBC.paymentmode.interest}"/>

                            <h:outputLabel value="First Paid(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage=" interest can't be empty" required="true"
                                         id="txtfirstPaid" value="#{ContractBC.contract.firstPaid}"
                                         size="30" converterMessage="interest must be number">
                                <a4j:support event="onchange" action="#{ContractBC.firstPaidChanged}" ajaxSingle="true"/>
                            </h:inputText>
                            <rich:message for="txtfirstPaid" style="color:red;"/>
                            <h:outputLabel value="Total Cost(*): " styleClass="khungchu">
                                <h:outputLabel value="#{ContractBC.contract.totalCost}"/>
                            </h:outputLabel>
                            <br/>
                            <br/>
                            <h:outputLabel value="Account Name" styleClass="khungchu"/>
                            <h:selectOneMenu value="#{ContractBC.username}">
                                <f:selectItems value="#{ContractBC.listAccount}"/>
                            </h:selectOneMenu>
                            <h:outputLabel/>
                            <a4j:commandButton value="Update" action="#{ContractBC.updateContract}" reRender="main"
                                               oncomplete="if(#{PaymentModeBC.errors==0})#{rich:component('updatePanel')}.hide();" />
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
        <!--Delete -->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Payment Details Panel" />
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
                        <h:outputLabel value="Are you sure to delete this ontract ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{ContractBC.deleteContract}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </html>
</f:view>
