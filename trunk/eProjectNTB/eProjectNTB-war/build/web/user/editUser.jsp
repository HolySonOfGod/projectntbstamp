<%--
    Document   : apartmentType
    Created on : Oct 22, 2011, 9:05:53 AM
    Author     : phamdoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:subview id="EventTypeUser">
    <h:form>
        <a4j:outputPanel id="main" ajaxRendered="true">
            <rich:dataTable columns="0" border="0"
                              styleClass="faqKhung" columnClasses="khung0" style="background: none; border: 0;"
                              rows="1"
                            cellpadding="0" cellspacing="0" rowKeyVar="row" 
                         var="rowAccount" value="#{RegisterUserBC.listUserByUsername}">

                <rich:column>
                    <div style="border-bottom: 1px #654c3d dashed; padding: 6px 0 3px 0; width: 160px;">
                    <a4j:commandLink id="updateLink"
                                     oncomplete="#{rich:component('updatePanel')}.show()"
                                     styleClass="khungmenu1" style="text-decoration:none; color: #654c3d;font-size: 14px;font-family:Arial, Helvetica, sans-serif;padding-left:11px; " value="EDIT INFO">
                        <f:setPropertyActionListener value="#{rowAccount}" target="#{RegisterUserBC.account}" />
                    </a4j:commandLink>
                    <rich:toolTip for="updateLink" value="Edit accounts" />
                    </div>
                </rich:column>

            </rich:dataTable>
        </a4j:outputPanel>
    </h:form>



    <rich:modalPanel id="updatePanel" autosized="true" width="200">
        <f:facet name="header">
            <h:outputLabel value="Update account Panel" />
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
                        <h:outputLabel value="Username: " styleClass="khungchu"/>
                        <h:outputLabel value="#{RegisterUserBC.account.username}" style="font-weight:bold; color:blue;"/>

                         <h:outputLabel value="Password (*): " styleClass="khungchu"/>
                            <h:inputSecret requiredMessage="Password can't be empty" required="true"
                                           id="txtPassACC" value="#{RegisterUserBC.account.password}" size="30">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputSecret>
                            <rich:message for="txtPassACC" style="color:red;"/>

                        <h:outputLabel value="First name(*): " styleClass="khungchu"/>
                        <h:inputText requiredMessage="First name can't be empty" converterMessage="First name has maximum 50 characters"
                                     size="30" maxlength="50" required="true" id="txtFirst" value="#{RegisterUserBC.account.firstName}">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtFirst" style="color:red;"/>

                        <h:outputLabel value="Last name(*): " styleClass="khungchu"/>
                        <h:inputText requiredMessage="Last name can't be empty" converterMessage="Last name has maximum 150 characters"
                                     size="30" maxlength="150" required="true" id="txtLast" value="#{RegisterUserBC.account.lastName}">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="txtLast" style="color:red;" />

                        <h:outputLabel value="Email(*): " styleClass="khungchu"/>
                        <h:inputText size="30" maxlength="100" required="true" id="txtEmail" value="#{RegisterUserBC.account.email}">
                            <rich:beanValidator summary="Message"/>
                        </h:inputText>
                        <rich:message for="txtEmail" style="color:red;"/>

                        <h:outputLabel value="Phone: " styleClass="khungchu"/>
                        <h:inputText size="30" id="txtPhone" maxlength="20" value="#{RegisterUserBC.account.phone}">
                            <rich:beanValidator summary="Message"/>
                        </h:inputText>
                        <rich:message for="txtPhone" style="color:red;"/>

                        <h:outputLabel value="Address: " styleClass="khungchu"/>
                        <h:inputTextarea id="txtAddress" value="#{RegisterUserBC.account.address}" cols="33">
                            <rich:beanValidator summary="Message"/>
                        </h:inputTextarea>
                        <rich:message for="txtAddress" style="color:red;"/>

                        <h:outputLabel value="Birthday: " styleClass="khungchu"/>
                        <rich:calendar  showInput="true" enableManualInput="true" converterMessage="Invalid Date"
                                        id="txtbd" value="#{RegisterUserBC.account.birthday}">
                            <rich:ajaxValidator event="onblur"/>
                        </rich:calendar>
                        <rich:message for="txtbd" style="color:red;"/>

                        <h:outputLabel value="Gender: " styleClass="khungchu"/>
                        <h:selectOneRadio value="#{RegisterUserBC.account.gender}">
                            <f:selectItem itemLabel="Male" itemValue="#{true}"/>
                            <f:selectItem itemLabel="Female" itemValue="#{false}"/>
                        </h:selectOneRadio>
                        <h:outputLabel value="  " styleClass="khungchu"/>
                        <h:outputLabel value="____________" styleClass="khungchu"/>
                        <a4j:commandButton value="Update" action="#{RegisterUserBC.UpdateUser}" reRender="main"
                                           oncomplete="#{rich:component('updatePanel')}.hide();"
                                           styleClass="khungSave3"/>
                    </h:panelGrid>
            </a4j:outputPanel>
        </h:form>
    </rich:modalPanel>
</f:subview>
