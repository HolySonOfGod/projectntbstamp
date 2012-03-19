<%--
    Document   : newsAll
    Created on : Oct 11, 2011, 3:07:04 PM
    Author     : Nguyen Dang Hoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui"%>


<f:subview id="newsListUser">
    <h:form>
        <rich:panel style="width:700px; align:center;" id="main">
            <a4j:outputPanel id="tableLocation" ajaxRendered="true">
                <rich:dataTable rows="15" id="listLocation" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="680px"
                                style="height:auto;" border="0" var="rowContract" value="#{ContractBC.listContractByUsername}">
                    <rich:column style="width:5px; tex-algin:center;">
                        <f:facet name="header">
                            <h:outputLabel value="No." />
                        </f:facet>
                        <h:outputLabel value="#{row+1}" />
                    </rich:column>

                    <rich:column style="width:10px;" >
                        <f:facet name="header">
                            <h:outputLabel value="Date" />
                        </f:facet>
                        <h:outputLabel value="#{rowContract.dateCreate}" >
                            <f:convertDateTime dateStyle="default" pattern="MM/dd/yyyy"/>
                        </h:outputLabel>
                    </rich:column>

                    <rich:column style="width:300px;" >
                        <f:facet name="header">
                            <h:outputLabel value="Apartment" />
                        </f:facet>
                        <h:outputLabel value="#{rowContract.apartments.floors.buildings.buildingName}" >
                        </h:outputLabel>
                    </rich:column>

                    <rich:column style="width:145px;" >
                        <f:facet name="header">
                            <h:outputLabel value="Payment" />
                        </f:facet>
                        <h:outputLabel value="#{rowContract.paymentModes.paymentModeName}" >
                        </h:outputLabel>
                    </rich:column>

                    <rich:column style="width:100px;" >
                        <f:facet name="header">
                            <h:outputLabel value="Total Cost" />
                        </f:facet>
                        $<h:outputLabel value="#{rowContract.totalCost}" >
                        </h:outputLabel>
                    </rich:column>



                    <rich:column width="70px">
                        <f:facet name="header">
                            <h:outputLabel value="Command" />
                        </f:facet>
                        <a4j:commandLink id="ViewLink"
                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                         action="#{ContractBC.setContractIDToSession}" >
                            <h:graphicImage value="images/psd/view.png"/>
                            <f:setPropertyActionListener value="#{rowContract}" target="#{ContractBC.contract}" />
                        </a4j:commandLink>
                        <rich:toolTip for="ViewLink" value="View Contract" />

                    </rich:column>
                    <f:facet name="footer">
                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                    </f:facet>

                </rich:dataTable>
            </a4j:outputPanel>
        </rich:panel>
    </h:form>
    <!--View Payment Modes-->
    <rich:modalPanel id="viewPanel" autosized="true" width="400">
        <f:facet name="header">
            <h:outputLabel value="View Contract Details Panel" />
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

                <div style="background: #FFFFFF;font-size: 14px; font-family:Arial, Helvetica, sans-serif; padding: 10px; text-align: left;">
                    <div style="float: left; width: 170px; color: #333333; padding-top: 5px;">
                        <h:outputLabel value="Contract ID: "/>                    
                        <b><h:outputText value="#{ContractBC.contract.contractID}"/></b>
                    </div>
                    <div style="float: right; width: 170px; color: #333333; padding-top: 5px; text-align: right;">
                        <h:outputLabel value="Apartment ID: "/>
                        <b><h:outputText value="#{ContractBC.contract.apartments.apartmentID}"/></b>
                    </div>
                    <div style="clear: both;"></div>
                    <div style="border-top: 1px #25a0d8 solid; height: 5px; margin-top: 5px; width: 100%;"></div>
                    <div align="center" style="font-size: 18px;font-weight: bold;font-family:Arial, Helvetica, sans-serif;padding:5px;color:#005ba2;">
                        <h:outputLabel value="#{ContractBC.contract.apartments.floors.buildings.buildingName}"/>
                    </div>
                    <div style="clear: both;"></div>
                    <div style="float: left; width: 340px; color: #333333; padding-top: 5px;">
                        <h:outputLabel value="Username: "/>
                        <b><h:outputText value="#{ContractBC.contract.accounts.username}"/></b>
                    </div>
                    <div style="clear: both;"></div>

                    <div style="float: left; width: 170px; color: #333333; padding-top: 5px;">
                        <h:outputLabel value="First Name "/>
                        <b><h:outputText value="#{ContractBC.contract.accounts.firstName}"/></b>
                    </div>
                    <div style="float: left; width: 170px; color: #333333; padding-top: 5px;">
                        <h:outputLabel value="Phone:"/>
                        <h:outputText value="#{ContractBC.contract.accounts.phone}"/>
                    </div>
                    <div style="clear: both;"></div>

                    <div style="float: left; width: 340px; color: #333333; padding-top: 5px;">
                        <h:outputLabel value="Email: "/>
                        <b><h:outputText value="#{ContractBC.contract.accounts.email}"/></b>
                    </div>
                    <div style="clear: both;"></div>
                    <div style="border-top: 1px #25a0d8 solid; height: 5px; margin-top: 5px; width: 100%;"></div>

                    <div style="float: left; width: 170px; color: #333333; padding-top: 5px;">
                        <h:outputLabel value="Payment Mode: "/>
                        <b><h:outputText value="#{ContractBC.contract.paymentModes.paymentModeName}"/></b>
                    </div>
                    <div style="float: left; width: 170px; color: #333333; padding-top: 5px;">
                        <h:outputLabel value="Date Create: "/>
                        <b><h:outputText value="#{ContractBC.contract.dateCreate}">
                                <f:convertDateTime pattern="MM/dd/yyyy"/>
                            </h:outputText></b>
                    </div>
                    <div style="clear: both;"></div>
                    <div style="border-top: 1px #25a0d8 solid; height: 5px; margin-top: 5px; width: 100%;"></div>

                    <div style="padding: 5px;">
                        <table cellpadding="5" cellspacing="5">
                            <tr>
                                <td>
                                    <h:outputLabel  value="Stamp Duty Cost: "/>
                                </td>
                                <td>
                                    <b>$<h:outputText value="#{ContractBC.contract.stampDutyCost}"/></b>
                                </td>
                            </tr>
                            <tr><td>
                                    <h:outputLabel  value="Apartment Price:"/>
                                </td><td>
                                    <b>$<h:outputText value="#{ContractBC.contract.apartmentPrice}"/></b>
                            </tr><tr><td>
                                    <h:outputLabel value="Total Cost: "/>
                                </td><td>
                                    <b>$<h:outputText value="#{ContractBC.contract.totalCost}"/> </b>
                                </td></tr><tr><td>
                                    <h:outputLabel value="First Paid: "/></td><td>
                                    <b>$<h:outputText value="#{ContractBC.contract.firstPaid}"/></b>
                            </tr></table>
                    </div>
                </div>

            </a4j:outputPanel>
        </h:form>
    </rich:modalPanel>
</f:subview>