<%-- 
    Document   : accountpage
    Created on : Oct 10, 2011, 11:32:13 PM
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
            <title>Manage Account Page || Administrator</title>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <p:resources/>
        </head>
        <body>
            <!-- Check administrator logged in or yet -->
            <%
                        Object o = ThaoTacSession.layXuong("ADMIN");
                        if (o == null) {
                            response.sendRedirect("login.jsp");
                        }
            %>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/s_Accounts.jsp" flush="true"/>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border"><div class="block-content">
                    <h1>Accounts management</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlAccount" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <a4j:outputPanel ajaxRendered="true">
                            <rich:panel style="width:100%; align:center;" id="main">
                                <h:panelGrid columns="4">
                                    <h:outputLabel value="First Name: *"/>
                                    <h:inputText value="#{AccountBC.firstName}" size="30"/>
                                    <a4j:commandButton action="#{AccountBC.searchAccount}" value="Search" reRender="main"/>
                                    <a4j:commandButton action="#{AccountBC.showAll}" value="Show All" reRender="main"/>                                    
                                    <br/>
                                </h:panelGrid>
                                <a4j:outputPanel id="tableAccount" ajaxRendered="true">
                                    <rich:dataTable rows="10" id="listAccount" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                    onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                    cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                    style="height:auto; text-align:center;" border="0" var="rowAccount" value="#{AccountBC.listAccount}">
                                        <f:facet name="header">
                                            <h:outputLabel value="Listing Accounts" />
                                        </f:facet>
                                        <rich:column style="width:5px;">
                                            <f:facet name="header">
                                                <h:outputLabel value="No." />
                                            </f:facet>
                                            <h:outputLabel value="#{row+1}" />
                                        </rich:column>
                                        <rich:column style="width:auto;" >
                                            <f:facet name="header">
                                                <h:outputLabel value="Username" />
                                            </f:facet>
                                            <h:outputLabel value="#{rowAccount.username}" />
                                        </rich:column>
                                        <rich:column style="width:auto;" >
                                            <f:facet name="header">
                                                <h:outputLabel value="Full name" />
                                            </f:facet>
                                            <h:outputLabel value="#{rowAccount.lastName} #{rowAccount.firstName}" />
                                        </rich:column>
                                        <rich:column style="width:auto;" >
                                            <f:facet name="header">
                                                <h:outputLabel value="Email" />
                                            </f:facet>
                                            <h:outputLabel value="#{rowAccount.email}" />
                                        </rich:column>
                                        <rich:column style="width:auto;" >
                                            <f:facet name="header">
                                                <h:outputLabel value="Phone" />
                                            </f:facet>
                                            <h:outputLabel value="#{rowAccount.phone}" />
                                        </rich:column>
                                        <rich:column style="width:auto;" >
                                            <f:facet name="header">
                                                <h:outputLabel value="Address" />
                                            </f:facet>
                                            <h:outputLabel value="#{rowAccount.address}" />
                                        </rich:column>
                                        <rich:column style="width:auto;" >
                                            <f:facet name="header">
                                                <h:outputLabel value="Birthday" />
                                            </f:facet>
                                            <h:outputLabel value="#{rowAccount.birthday}" />
                                        </rich:column>
                                        <rich:column style="width:auto;" >
                                            <f:facet name="header">
                                                <h:outputLabel value="Role" />
                                            </f:facet>
                                            <h:outputLabel value="#{rowAccount.roles.roleName}"/>
                                        </rich:column>

                                        <rich:column width="50px">
                                            <f:facet name="header">
                                                <h:outputLabel value="Command" />
                                            </f:facet>
                                            <a4j:commandLink id="ViewLink"
                                                             oncomplete="#{rich:component('viewPanel')}.show()"
                                                             action="#{AccountBC.setUsernameToSession}" >
                                                <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                                <f:setPropertyActionListener value="#{rowAccount}" target="#{AccountBC.account}" />
                                            </a4j:commandLink>
                                            <rich:toolTip for="ViewLink" value="View Account" />
                                            <a4j:commandLink id="updateLink"
                                                             oncomplete="#{rich:component('updatePanel')}.show()"
                                                             action="#{AccountBC.setUsernameToSession}" >
                                                <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                                <f:setPropertyActionListener value="#{rowAccount}" target="#{AccountBC.account}" />
                                            </a4j:commandLink>
                                            <rich:toolTip for="updateLink" value="Update Account" />
                                        </rich:column>

                                        <f:facet name="footer">
                                            <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                        </f:facet>
                                    </rich:dataTable>
                                    <a4j:commandButton id="insertButton"
                                                       oncomplete="#{rich:component('insertPanel')}.show()"
                                                       value="Insert new account">
                                    </a4j:commandButton>
                                </a4j:outputPanel>
                            </rich:panel>
                        </a4j:outputPanel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->

        <!--View Account Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="250">
            <f:facet name="header">
                <h:outputLabel value="View Account Details Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeView"
                                    styleClass="hidelink" style="width:18px;height:18px"/>
                    <rich:componentControl for="viewPanel" attachTo="closeView"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="2">
                        <h:outputLabel style="width:100px;" value="Username: "/>
                        <h:outputText style="font-weight:bold;" value="#{AccountBC.account.username}"/>
                        <h:outputLabel style="width:100px;" value="First Name: "/>
                        <h:outputText style="font-weight:bold;" value="#{AccountBC.account.firstName}"/>
                        <h:outputLabel style="width:100px;" value="Last name: " />
                        <h:outputText style="font-weight:bold;" value="#{AccountBC.account.lastName}"/>
                        <h:outputLabel style="width:100px;" value="Email: " />
                        <h:outputText style="font-weight:bold;" value="#{AccountBC.account.email}"/>
                        <h:outputLabel style="width:100px;" value="Phone: " />
                        <h:outputText style="font-weight:bold;" value="#{AccountBC.account.phone}"/>
                        <h:outputLabel style="width:100px;" value="Address: " />
                        <h:outputText style="font-weight:bold;" value="#{AccountBC.account.address}"/>
                        <h:outputLabel style="width:100px;" value="Birthday: " />
                        <h:outputText style="font-weight:bold;" value="#{AccountBC.account.birthday}"/>
                        <h:outputLabel style="width:100px;" value="Is Male: " />
                        <h:selectBooleanCheckbox disabled="true" value="#{AccountBC.account.gender}"/>
                        <h:outputLabel style="width:1000px;" value="Status: " />
                        <h:selectBooleanCheckbox disabled="true" value="#{AccountBC.account.status}"/>
                        <h:outputLabel style="width:100px;" value="Role: " />
                        <h:outputText style="font-weight:bold;" value="#{AccountBC.account.roles.roleName}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Account Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Insert New Account Panel"/>
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
                            <h:outputLabel value="Username (*): " styleClass="khungchu"/>
                            <h:inputText id="txtUserACC" value="#{AccountBC.account.username}"
                                         required="true" maxlength="50" size="73"
                                         requiredMessage="Username can't be empty">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtUserACC" style="color:red;"/>

                            <h:outputLabel value="Password (*): " styleClass="khungchu"/>
                            <h:inputSecret requiredMessage="Password can't be empty" required="true"
                                           id="txtPassACC" value="#{AccountBC.account.password}" size="73">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputSecret>
                            <rich:message for="txtPassACC" style="color:red;"/>

                            <h:outputLabel value="First name(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="First name can't be empty" value="#{AccountBC.account.firstName}"
                                         converterMessage="First name has maximum 50 characters" size="73"
                                         maxlength="50" required="true" id="txtFirstACC">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtFirstACC" style="color:red;"/>

                            <h:outputLabel value="Last name(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Last name can't be empty" converterMessage="Last name has maximum 150 characters"
                                         size="73" maxlength="150" required="true" id="txtLastACC" value="#{AccountBC.account.lastName}">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtLastACC" style="color:red;"/>

                            <h:outputLabel value="Email(*): " styleClass="khungchu"/>
                            <h:inputText size="73" maxlength="100" required="true" id="txtEmailACC" value="#{AccountBC.account.email}"
                                         requiredMessage="Email can't be empty" converterMessage="Invalid Email">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtEmailACC" style="color:red;"/>

                            <h:outputLabel value="Phone: " styleClass="khungchu"/>
                            <h:inputText size="73" id="txtPhoneACC" maxlength="20" value="#{AccountBC.account.phone}"
                                         converterMessage="Phone has maximum 20 characters">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtPhoneACC" style="color:red;"/>

                            <h:outputLabel value="Address: " styleClass="khungchu"/>
                            <h:inputTextarea id="txtAddressACC" value="#{AccountBC.account.address}" cols="62">
                                <rich:beanValidator summary="Message"/>
                            </h:inputTextarea>
                            <rich:message for="txtAddressACC" style="color:red;"/>

                            <h:outputLabel value="Birthday: " styleClass="khungchu"/>
                            <rich:calendar  showInput="true" enableManualInput="true" converterMessage="Invalid Date"
                                            id="txtbd" value="#{AccountBC.account.birthday}">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="txtbd" style="color:red;"/>

                            <h:outputLabel value="Gender: " styleClass="khungchu"/>
                            <h:selectOneRadio value="#{AccountBC.account.gender}">
                                <f:selectItem itemLabel="Male" itemValue="#{true}"/>
                                <f:selectItem itemLabel="Female" itemValue="#{false}"/>
                            </h:selectOneRadio>
                            <h:outputLabel value=""/>

                            <h:outputLabel value="Role:  " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{AccountBC.roleID}">
                                <f:selectItems value="#{AccountBC.listRoleName}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{AccountBC.createAccount}" reRender="main" 
                                               oncomplete="if(#{AccountBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update account Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
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
                        <h:panelGrid columns="1">
                            <h:outputLabel value="Username: " styleClass="khungchu"/>
                            <h:outputText style="font-weight:bold; color:blue;" value="#{AccountBC.account.username}"/>
                            <h:outputLabel value=""/>

                            <h:outputLabel value="First name(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="First name can't be empty" converterMessage="First name has maximum 50 characters"
                                         size="73" maxlength="50" required="true" id="txtFirst" value="#{AccountBC.account.firstName}">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtFirst" style="color:red;"/>

                            <h:outputLabel value="Last name(*): " styleClass="khungchu"/>
                            <h:inputText requiredMessage="Last name can't be empty" converterMessage="Last name has maximum 150 characters"
                                         size="73" maxlength="150" required="true" id="txtLast" value="#{AccountBC.account.lastName}">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtLast" style="color:red;" />

                            <h:outputLabel value="Email(*): " styleClass="khungchu"/>
                            <h:inputText size="73" maxlength="100" required="true" id="txtEmail" value="#{AccountBC.account.email}">
                                <rich:beanValidator summary="Message"/>
                            </h:inputText>
                            <rich:message for="txtEmail" style="color:red;"/>

                            <h:outputLabel value="Phone: " styleClass="khungchu"/>
                            <h:inputText size="73" id="txtPhone" maxlength="20" value="#{AccountBC.account.phone}">
                                <rich:beanValidator summary="Message"/>
                            </h:inputText>
                            <rich:message for="txtPhone" style="color:red;"/>

                            <h:outputLabel value="Address: " styleClass="khungchu"/>
                            <h:inputTextarea id="txtAddress" value="#{AccountBC.account.address}" cols="62">
                                <rich:beanValidator summary="Message"/>
                            </h:inputTextarea>
                            <rich:message for="txtAddress" style="color:red;"/>

                            <h:outputLabel value="Birthday: " styleClass="khungchu"/>
                            <rich:calendar  showInput="true" enableManualInput="true" converterMessage="Invalid Date"
                                            id="txtbd" value="#{AccountBC.account.birthday}">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="txtbd" style="color:red;"/>

                            <h:outputLabel value="Gender: " styleClass="khungchu"/>
                            <h:selectOneRadio value="#{AccountBC.account.gender}">
                                <f:selectItem itemLabel="Male" itemValue="#{true}"/>
                                <f:selectItem itemLabel="Female" itemValue="#{false}"/>
                            </h:selectOneRadio>
                            <h:outputLabel value=""/>

                            <h:outputLabel value="Status: " styleClass="khungchu"/>
                            <h:selectBooleanCheckbox value="#{AccountBC.account.status}" />
                            <h:outputLabel value=""/>

                            <h:outputLabel value="Role: " styleClass="khungchu"/>
                            <h:selectOneMenu value="#{AccountBC.roleID}">
                                <f:selectItems value="#{AccountBC.listRoleName}"/>
                            </h:selectOneMenu>
                            <h:outputLabel value=""/>

                            <h:inputHidden value="#{AccountBC.account.password}"/>

                            <a4j:commandButton value="Update" action="#{AccountBC.updateAccount}" reRender="main"
                                               oncomplete="if(#{AccountBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>

