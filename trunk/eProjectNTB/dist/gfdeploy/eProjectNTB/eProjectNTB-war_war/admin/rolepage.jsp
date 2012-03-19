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
            <title>Manage Role Page || Administrator</title>
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
        <section class="grid_12" style="width: 100%;">
            <div class="block-border"><div class="block-content">
                    <h1>Roles management</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlRole" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>

                    <h:form>
                        <rich:panel style="width:100%; align:center;" header="Manage Role" id="main">
                            <a4j:outputPanel id="tableRole" ajaxRendered="true">
                                <rich:dataTable rows="5" id="listRole" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; text-align:center;" border="0" var="rowRole" value="#{RoleBC.listRole}">
                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Roles" />
                                    </f:facet>
                                    <rich:column style="width:5px">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:auto" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Role ID" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowRole.roleID}" />
                                    </rich:column>
                                    <rich:column style="width:auto" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Role Name" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowRole.roleName}" />
                                    </rich:column>

                                    <rich:column style="width:auto" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Description" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowRole.description}" />
                                    </rich:column>

                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{RoleBC.setRoleIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowRole}" target="#{RoleBC.role}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Role" />
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{RoleBC.setRoleIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowRole}" target="#{RoleBC.role}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update Role" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{RoleBC.setRoleToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowRole}" target="#{RoleBC.role}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Role" />
                                    </rich:column>

                                    <rich:column width="50px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Insert" />
                                        </f:facet>

                                        <a4j:commandLink id="InsertAccount"
                                                         oncomplete="#{rich:component('insertAccountPanel')}.show()"
                                                         action="#{AccountBC.setRoleIDToSession}" value="Account">
                                            <f:setPropertyActionListener value="#{rowRole.roleID}" target="#{AccountBC.roleID}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="InsertAccount" value="Insert accounts for this role" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>
                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new role">
                                </a4j:commandButton>
                                &nbsp;&nbsp;&nbsp;
                                <a4j:commandButton id="GoToAccountPage" action="accountpage" value="Go to Manage accounts"/>
                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->

        <!--Insert New Account Panel-->
        <rich:modalPanel id="insertAccountPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Insert New Account Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeInsertAccount"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertAccountPanel" attachTo="closeInsertAccount"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        <h:panelGrid columns="1">
                            <h:outputLabel value="Username (*): " styleClass="khungchu"/>
                            <h:inputText id="txtUser" value="#{AccountBC.account.username}" required="true" maxlength="50" size="73"
                                         requiredMessage="Username can't be empty" converterMessage="Username has maximum 50 characters">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtUser" style="color:red;"/>

                            <h:outputLabel value="Password (*): " styleClass="khungchu"/>
                            <h:inputSecret requiredMessage="Password can't be empty" required="true"
                                           id="txtPass" value="#{AccountBC.account.password}" size="73">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputSecret>
                            <rich:message for="txtPass" style="color:red;"/>

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
                            <rich:message for="txtLast" style="color:red;"/>

                            <h:outputLabel value="Email(*): " styleClass="khungchu"/>
                            <h:inputText size="73" maxlength="100" required="true" id="txtEmail" 
                                         requiredMessage="Email can't be empty and maximum 100 characters"
                                         converterMessage="Invalid email" value="#{AccountBC.account.email}">
                                <rich:ajaxValidator event="onblur"/>
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
                            <rich:calendar  showInput="true" enableManualInput="true" converterMessage="Date invalid"
                                            value="#{AccountBC.account.birthday}" id="txtBD">
                                <rich:ajaxValidator event="onblur"/>
                            </rich:calendar>
                            <rich:message for="txtBD" style="color:red;"/>

                            <h:outputLabel value="Gender: " styleClass="khungchu"/>
                            <h:selectOneRadio value="#{AccountBC.account.gender}">
                                <f:selectItem itemLabel="Male" itemValue="#{true}"/>
                                <f:selectItem itemLabel="Female" itemValue="#{false}"/>                                
                            </h:selectOneRadio>
                            <h:outputLabel value=""/>

                            <h:outputLabel value="Role: " styleClass="khungchu"/>
                            <h:inputText style="color:blue;font-weight:bold;" value="#{AccountBC.roleID}"/>
                            <h:outputLabel value=""/>

                            <a4j:commandButton value="Insert" action="#{AccountBC.createAccount}"
                                               oncomplete="if(#{AccountBC.errors==0})#{rich:component('insertAccountPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--View Role Panel-->
        <rich:modalPanel id="viewPanel" autosized="true" width="200">
            <f:facet name="header">
                <h:outputLabel value="View Role Details Panel" />
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
                        <h:outputLabel style="width:70px;" value="Role ID: "/>
                        <h:outputText style="font-weight:bold;" value="#{RoleBC.role.roleID}"/>
                        <h:outputLabel style="width:70px;" value="Role Name: "/>
                        <h:outputText style="font-weight:bold;" value="#{RoleBC.role.roleName}"/>
                        <h:outputLabel style="width:70px;" value="Description: " />
                        <h:outputText style="font-weight:bold;" value="#{RoleBC.role.description}"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert New Role Panel-->
        <rich:modalPanel id="insertPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Insert New Role Panel"/>
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
                            <h:outputLabel value="Role Name(*) :  " styleClass="khungchu"/>
                            <h:inputText value="#{RoleBC.role.roleName}" required="true" maxlength="100" size="73"
                                         id="txtRName" requiredMessage="Role name can't be empty"
                                         converterMessage="Role name has maximum 100 characters">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtRName" style="color:red;"/>

                            <h:outputLabel value="Description :  " styleClass="khungchu"/>
                            <h:inputTextarea id="txtdes" cols="62" rows="3" value="#{RoleBC.role.description}">
                                <rich:beanValidator summary="Message"/>
                            </h:inputTextarea>
                            <rich:message for="txtdes" style="color:red"/>

                            <a4j:commandButton value="Insert" action="#{RoleBC.createRole}" reRender="main"
                                               oncomplete="if(#{RoleBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                               styleClass="khungSave2"/>
                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Update Role Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Update Role Panel" />
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
                            <h:outputLabel value="Role ID: " styleClass="khungchu"/>
                            <h:outputText style="font-weight:bold;color:blue;" value="#{RoleBC.role.roleID}"/>
                            <h:outputLabel/>

                            <h:outputLabel value="Role Name(*) :  " styleClass="khungchu"/>
                            <h:inputText value="#{RoleBC.role.roleName}" required="true" maxlength="100" size="73"
                                         id="txtRName" requiredMessage="Role name can't be empty"
                                         converterMessage="Role name has maximum 100 characters">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputText>
                            <rich:message for="txtRName" style="color:red;"/>

                            <h:outputLabel value="Description :  " styleClass="khungchu"/>
                            <h:inputTextarea id="txtdes" cols="62" rows="3" value="#{RoleBC.role.description}">
                                <rich:beanValidator summary="Message"/>
                            </h:inputTextarea>
                            <rich:message for="txtdes" style="color:red"/>

                            <a4j:commandButton value="Update" action="#{RoleBC.updateRole}" reRender="main"
                                               oncomplete="if(#{RoleBC.errors==0})#{rich:component('updatePanel')}.hide();" 
                                               styleClass="khungSave2"/>

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Delete Sure Question When Delete Role Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Role Panel" />
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
                        <h:outputLabel value="Are you sure to delete this role ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{RoleBC.deleteRole}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>
