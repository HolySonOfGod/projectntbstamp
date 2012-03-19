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
            <title>Manage Payment Detail Page</title>
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
                    <h1>Payment Details</h1>

                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlPaymentDetail" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tablePaymentDetail" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listPaymentDetail" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto;" border="0" var="rowDetail" value="#{PaymentDetailBC.listPaymentDetail}">


                                    <f:facet name="header">
                                        <rich:columnGroup>
                                            <rich:column>
                                                <h:outputLabel value="No." />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Payment Data" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="ContractID" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="UserName" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="TotalCost" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="A.Installment" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="InstallmentNo" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="AmountWeb" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="DateEnd" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="OtherCost" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Command"/>
                                            </rich:column>
                                        </rich:columnGroup>
                                    </f:facet>
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>

                                    <rich:column style="width:auto;">
                                        <f:facet name="header">
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.payDate}" >
                                            <f:convertDateTime dateStyle="default"  pattern="MM/dd/yyyy"/>
                                        </h:outputLabel>
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{paymentDetailFilter.filteringContractID}">
                                        <f:facet name="header">
                                            <h:inputText value="#{paymentDetailFilter.contractID}" required="true" requiredMessage="This field can't be blank" style="width: 85px;">
                                                <a4j:support event="onchange" reRender="tablePaymentDetail" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.contracts.contractID}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" filterMethod="#{paymentDetailFilter.filterDetailUsername}">
                                        <f:facet name="header">
                                            <h:inputText value="#{paymentDetailFilter.username}" style="width: 85px;">
                                                <a4j:support event="onkeyup" reRender="tablePaymentDetail" ignoreDupResponses="true"
                                                             oncomplete="setCaretToEnd(event);"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.contracts.accounts.username}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{paymentDetailFilter.filteringTotalCost}">
                                        <f:facet name="header">
                                            <h:inputText value="#{contractFilter.apartmentPrice}" required="true" requiredMessage="This field can't be blank" style="width: 85px;">
                                                <a4j:support event="onchange" reRender="tablePaymentDetail" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.contracts.totalCost}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" filterMethod="#{paymentDetailFilter.filteringFirstPaid}">
                                        <f:facet name="header">
                                            <h:inputText value="#{contractFilter.firstPaid}" required="true" requiredMessage="This field can't be blank" style="width: 85px;">
                                                <a4j:support event="onchange" reRender="tablePaymentDetail" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.contracts.firstPaid}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" filterMethod="#{paymentDetailFilter.filteringamountPaidPerInstallment}">
                                        <f:facet name="header">
                                            <h:inputText value="#{paymentDetailFilter.amountPaidPerInstallment}" required="true" requiredMessage="This field can't be blank" style="width: 85px;">
                                                <a4j:support event="onchange" reRender="tablePaymentDetail" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.amountPaidPerInstallment}" id="outamount" />
                                    </rich:column>

                                    <rich:column style="width:auto;" filterMethod="#{paymentDetailFilter.filteringAmountOWeb}">
                                        <f:facet name="header">
                                            <h:inputText value="#{paymentDetailFilter.amountOwed}" required="true" requiredMessage="This field can't be blank" style="width: 85px;">
                                                <a4j:support event="onchange" reRender="tablePaymentDetail" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.amountOwed}" />
                                    </rich:column>

                                    <rich:column style="width:auto;">
                                        <f:facet name="header">
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.dateEnd}">
                                            <f:convertDateTime  dateStyle="default" pattern="MM/dd/yyyy"/>
                                        </h:outputLabel>
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                        </f:facet>
                                        <h:outputLabel value="#{rowDetail.otherCost}" />
                                    </rich:column>
                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <f:facet name="header">
                                                <a4j:commandLink value="Reset table" action="#{paymentDetailFilter.resetDetailTable}" reRender="tablePaymentDetail"/>
                                            </f:facet>
                                        </f:facet>
                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{PaymentDetailBC.setPaymentDetailIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowDetail}" target="#{PaymentDetailBC.paymentDetail}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Payment Detail" />
                                        <!---
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{PaymentDetailBC.setPaymentDetailIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowDetail}" target="#{PaymentDetailBC.paymentDetail}" />
                                        </a4j:commandLink>

                                        <rich:toolTip for="updateLink" value="Update Payment Detail" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{PaymentDetailBC.setPaymentDetailIDToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowDetail}" target="#{PaymentDetailBC.paymentDetail}" />
                                        </a4j:commandLink>
                                        -->
                                        <rich:toolTip for="deleteLink" value="Delete Payment Details" />
                                    </rich:column>
                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Payment Detail">
                                </a4j:commandButton>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>

                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--View Payment-->
        <rich:modalPanel id="viewPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="View Payment Details Panel" />
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
                        <h:outputLabel style="width:70px;" value="Payment Detail ID : "/>
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.paymentDetailID}"/>
                        <h:outputLabel style="width:70px;" value="Contract Date " />
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.contracts.dateCreate}">
                            <f:convertDateTime  dateStyle="default" pattern="MM/dd/yyyy"/>
                        </h:outputText>
                        <h:outputLabel style="width:70px;" value="Last Name :" />
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.contracts.accounts.lastName}">
                        </h:outputText>
                        <h:outputLabel style="width:70px;" value="First Name :" />
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.contracts.accounts.firstName}">
                        </h:outputText>
                        <h:outputLabel style="width:70px;" value="Payment Detail ID : "/>
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.payDate}">
                            <f:convertDateTime  dateStyle="default" pattern="MM/dd/yyyy"/>
                        </h:outputText>
                        <h:outputLabel style="width:70px;" value="Amount PaidPer Installment : "/>
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.amountPaidPerInstallment}"/>
                        <h:outputLabel style="width:70px;" value="installmentNo: " />
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.installmentNo}"/>
                        <h:outputLabel style="width:70px;" value="Amount Paid: " />
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.amountPaid}"/>
                        <h:outputLabel style="width:70px;" value="amountOwed: " />
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.amountOwed}"/>
                        <h:outputLabel style="width:70px;" value="Date End: " />
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.dateEnd}">
                            <f:convertDateTime  dateStyle="default" pattern="MM/dd/yyyy"/>
                        </h:outputText>
                        <h:outputLabel style="width:70px;" value="otherCost: " />
                        <h:outputText value="#{PaymentDetailBC.paymentDetail.otherCost}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
        <!--Insert New PaymentDetail Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Insert New Payment Detail Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeInsert"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertPanel" attachTo="closeInsert"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form id="frmInsert">
                <a4j:outputPanel ajaxRendered="true" layout="block">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">

                            <h:outputLabel value="Contract ID : " styleClass="khungchu">
                                <h:selectOneMenu value="#{PaymentDetailBC.contractID}" immediate="true" id="contract" required="true" requiredMessage="Contract ID can't be blank">
                                    <f:selectItem itemLabel="Select a ContractID"/>
                                    <f:selectItems value="#{PaymentDetailBC.listContractID}"/>
                                    <rich:ajaxValidator event="onblur"/>
                                    <a4j:support event="onchange" action="#{PaymentDetailBC.onchanger}" ajaxSingle="true"/>
                                </h:selectOneMenu>
                                <rich:message for="contract" style="color:red;"/>
                            </h:outputLabel>
                            <h:outputLabel/>
                            <br/>
                            <h:outputLabel value="User Name : " styleClass="khungchu">
                                <h:outputLabel value="#{PaymentDetailBC.username}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <br/>
                            <h:outputLabel value="Payment Name : "  styleClass="khungchu">
                                <h:outputLabel value="#{PaymentDetailBC.paymentname}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <br/>
                            <h:outputLabel value="Installment : " styleClass="khungchu">
                                <h:outputLabel value="#{PaymentDetailBC.installment}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <br/>

                            <h:outputLabel value="Installment No : " styleClass="khungchu">
                                <h:outputLabel value="#{PaymentDetailBC.installmentNo}"/>
                            </h:outputLabel>
                            <br/>
                            <h:outputLabel value=" TotalCost : " styleClass="khungchu">
                                <h:outputLabel value="#{PaymentDetailBC.totalCost}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <br/>

                            <h:outputLabel value="Paid Monthly : " styleClass="khungchu">
                                <h:outputLabel value="#{PaymentDetailBC.amountPaidPerInstallment}" id="txtamountAll"/>
                            </h:outputLabel>
                            <br/>
                            <h:outputLabel value="Amount Paid : " styleClass="khungchu">
                                <h:outputLabel value="#{PaymentDetailBC.amountpaid}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <br/>
                            <h:outputLabel value="Amount OWeb : " styleClass="khungchu">
                                <h:outputLabel value="#{PaymentDetailBC.amountOweb}" styleClass="khungchu"/>
                            </h:outputLabel>
                            <br/>
                            <h:outputLabel value="Date End(*): " styleClass="khungchu"/>
                            <rich:calendar value="#{PaymentDetailBC.paymentDetail.dateEnd}" datePattern="MM/dd/yyyy"
                                           popup="true" id="txtdateEnd" boundaryDatesMode="scroll" dataModel="#{calendarModel}"
                                           mode="client" enableManualInput="true">
                            </rich:calendar>
                            <rich:message for="txtdateEnd" style="color:red;"/>

                            <h:outputLabel value="Other Cost (*): " styleClass="khungchu"/>
                            <h:outputLabel value="#{PaymentDetailBC.otherCost}"/>
                            <rich:message for="txtotherCost" style="color:red;"/>

                            <a4j:commandButton value="Insert" action="#{PaymentDetailBC.createPaymentDetail}" reRender="main"
                                               oncomplete="if(#{PaymentDetailBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave3"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
        <!--Update Payment Detail Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="Update Payment Detail" />
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
                            <h:outputLabel value="amountPaidPerInstallment (*): " styleClass="khungchu"/>
                            <h:inputText id="txtAmount" value="#{PaymentDetailBC.paymentDetail.amountPaidPerInstallment}" onblur="calc();"
                                         required="true" maxlength="100" size="30"
                                         requiredMessage="Amount  can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtAmount" style="color:red;"/>

                            <h:outputLabel value="Installment No(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Aount Paid can't be empty" required="true"
                                         id="txtInstallmentNo" value="#{PaymentDetailBC.paymentDetail.installmentNo}"
                                         size="30" converterMessage="Amount Paid must be number" >
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtInstallmentNo" style="color:red;"/>

                            <h:outputLabel value="Amount Paid(*): " styleClass="khungchu"/>
                            <h:outputText value="#{PaymentDetailBC.amountpaid}"/>

                            <h:outputLabel value="Amount OWeb(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Amount Owed can't be empty" required="true"
                                         id="txtamountOwed" value="#{PaymentDetailBC.paymentDetail.amountOwed}" onblur="calc();"
                                         size="30" converterMessage="Amount Owed must be number">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtamountOwed" style="color:red;"/>

                            <h:outputLabel value="Date End(*): " styleClass="khungchu"/>
                            <rich:calendar value="#{PaymentDetailBC.paymentDetail.dateEnd}" datePattern="MM/dd/yyyy" popup="true" id="txtdateEnd"
                                           boundaryDatesMode="scroll" dataModel="#{calendarModel}"
                                           mode="client" enableManualInput="true"
                                           requiredMessage="dateEnd  can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="txtdateEnd" style="color:red;"/>

                            <h:outputLabel value="OtherCost (*): " styleClass="khungchu"/>
                            <h:inputText id="txtotherCost" value="#{PaymentDetailBC.paymentDetail.otherCost}"
                                         required="true" maxlength="100" size="30"
                                         requiredMessage="Amount  can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtotherCost" style="color:red;"/>

                            <a4j:commandButton value="Update" action="#{PaymentDetailBC.updatePaymentDetail}" reRender="main"
                                               oncomplete="if(#{PaymentDetailBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave3" />

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>
