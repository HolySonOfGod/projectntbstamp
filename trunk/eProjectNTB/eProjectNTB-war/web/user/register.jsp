<%-- 
    Document   : register
    Created on : Oct 25, 2011, 8:16:11 PM
    Author     : Nhat Nguyen
--%>

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
            <title>Register Account Page</title>
            <jsp:include page="../style/meta.jsp" flush="true"/>
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <p:resources/>
        </head>
        <body id="page3" onload="new ElementMaxHeight();">
            <a4j:outputPanel ajaxRendered="true">
                <p:growl id="growlAccount" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
            </a4j:outputPanel>
            <jsp:include page="../style/u_Contract.jsp" flush="true"/>
            <div class="ndtrai">
                <img src="images/psd/menulogin.png"/>
                <div style="border-bottom: 1px #654c3d dashed; padding: 3px; width: 160px; padding-top: 6px;">
                    <a Class="khungmenu1" style="text-decoration:none; color: #654c3d;" href="login.jsp">LOGIN</a>
                </div>
                <br/><br/>
                <jsp:include page="feedbackInsert.jsp" flush="true"/>
            </div><div class="ndphai">
                <img src="images/psd/register.png"/>
                <br/>
                <center>
                    <div class="gioithieu3">
                        <h:form>
                            <h:panelGrid columns="2" width="500px" >
                                <h:outputLabel value="Username (*): " styleClass="khungchu1"/>
                                <h:inputText id="txtUser" value="#{RegisterUserBC.account.username}"
                                             required="true" maxlength="50" size="73"
                                             requiredMessage="Username can't be empty">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputText>
                                <h:outputLabel value=""/>
                                <rich:message for="txtUser" style="color:red;"/>

                                <h:outputLabel value="Password (*): " styleClass="khungchu1"/>
                                <h:inputSecret requiredMessage="Password can't be empty" required="true"
                                               id="txtPass" value="#{RegisterUserBC.account.password}" size="73">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputSecret>
                                <h:outputLabel value=""/>
                                <rich:message for="txtPass" style="color:red;"/>

                                <h:outputLabel value="First name(*): " styleClass="khungchu1"/>
                                <h:inputText requiredMessage="First name can't be empty"
                                             value="#{RegisterUserBC.account.firstName}"
                                             converterMessage="First name has maximum 50 characters" size="73"
                                             maxlength="50" required="true" id="txtFirst">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputText>
                                <h:outputLabel value=""/>
                                <rich:message for="txtFirst" style="color:red;"/>

                                <h:outputLabel value="Last name(*): " styleClass="khungchu1"/>
                                <h:inputText requiredMessage="Last name can't be empty"
                                             converterMessage="Last name has maximum 150 characters"
                                             size="73" maxlength="150" required="true" id="txtLast"
                                             value="#{RegisterUserBC.account.lastName}">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputText>
                                <h:outputLabel value=""/>
                                <rich:message for="txtLast" style="color:red;"/>

                                <h:outputLabel value="Email(*): " styleClass="khungchu1"/>
                                <h:inputText size="73" maxlength="100" required="true" id="txtEmail"
                                             value="#{RegisterUserBC.account.email}"
                                             requiredMessage="Email can't be empty"
                                             converterMessage="Invalid Email">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputText>
                                <h:outputLabel value=""/>
                                <rich:message for="txtEmail" style="color:red;"/>

                                <h:outputLabel value="Phone: " styleClass="khungchu1"/>
                                <h:inputText size="73" id="txtPhone" maxlength="20"
                                             value="#{RegisterUserBC.account.phone}"
                                             converterMessage="Phone has maximum 20 characters">
                                    <rich:ajaxValidator event="onblur"/>
                                </h:inputText>
                                <h:outputLabel value=""/>
                                <rich:message for="txtPhone" style="color:red;"/>

                                <h:outputLabel value="Address: " styleClass="khungchu1"/>
                                <h:inputTextarea id="txtAddress" value="#{RegisterUserBC.account.address}" cols="62" style="width:200px;">
                                    <rich:beanValidator summary="Message"/>
                                </h:inputTextarea>
                                <h:outputLabel value=""/>
                                <rich:message for="txtAddress" style="color:red;"/>

                                <h:outputLabel value="Birthday: " styleClass="khungchu1"/>
                                <rich:calendar  showInput="true" enableManualInput="true" converterMessage="Invalid Date"
                                                id="txtbd" value="#{RegisterUserBC.account.birthday}">
                                    <rich:ajaxValidator event="onblur"/>
                                </rich:calendar>
                                <h:outputLabel value=""/>
                                <rich:message for="txtbd" style="color:red;"/>

                                <h:outputLabel value="Gender: " styleClass="khungchu11"/>
                                <h:selectOneRadio value="#{RegisterUserBC.account.gender}">
                                    <f:selectItem itemLabel="Male" itemValue="#{true}"/>
                                    <f:selectItem itemLabel="Female" itemValue="#{false}"/>
                                </h:selectOneRadio>

                                <h:outputLabel value=""/>

                                <a4j:commandLink action="#{RegisterUserBC.registerUser}">
                                    <h:graphicImage url="images/psd/btnregister.png" />
                                </a4j:commandLink>
                            </h:panelGrid>
                        </h:form>
                    </div>
                </center>
                <br/>
                <br/>
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
        </body>
    </html>
</f:view>
