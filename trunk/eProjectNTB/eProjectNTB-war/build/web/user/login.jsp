<%-- 
    Document   : login
    Created on : Oct 25, 2011, 8:01:05 PM
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
            <title>Contract</title>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/meta.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
        </head>
        <!--//Noi dung se them vao o day -->
        <body id="page3" onload="new ElementMaxHeight();">
            <a4j:outputPanel ajaxRendered="true">
                <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
            </a4j:outputPanel>
            <jsp:include page="../style/u_Contract.jsp" flush="true"/>
            <div class="ndtrai">                
                <jsp:include page="feedbackInsert.jsp" flush="true"/>
            </div><div class="ndphai">
                <img src="images/psd/login.png"/>
                <br/>
                <h:form>
                    <div align="center">
                        <div align="center" style="width: 400px; text-align: center; padding-top: 30px; padding-bottom: 30px; color: #003147;">
                            <table cellpadding="5" border="0" cellspacing="5">
                                <tr><td><b><h:outputLabel value="Username: *"/></b></td>
                                    <td><h:inputText value="#{LoginBC.username}" id="txtUsername" required="true" size="30"
                                                 requiredMessage="Please input your username, thanks!"
                                                 style="background:#ffffff;"/>
                                        <br/><h:message for="txtUsername" style="color:red;"/></td>
                                </tr>
                                <tr><td><b><h:outputLabel value="Password: *"/></b></td>
                                    <td><h:inputSecret value="#{LoginBC.password}" id="txtPassword" required="true" size="30"
                                                   requiredMessage="Please input your password, thanks!"
                                                   style="background:#ffffff;"/>
                                        <br/><h:message for="txtPassword" style="color:red;"/></td>
                                <tr><td colspan="2" align="right">
                                        <a href="register.jsp"><img src="images/psd/btnregister.png" border="0"/></a>
                                        &nbsp;&nbsp;&nbsp;
                                        <h:commandLink action="#{LoginBC.homeLogin}">
                                            <h:graphicImage url="images/psd/btnlogin.png" />
                                        </h:commandLink>
                                    </td></tr>
                                <tr><td colspan="2" align="right">
                                        <a4j:commandLink id="insertButton"
                                                         oncomplete="#{rich:component('insertPanel')}.show()"
                                                         style="text-decoration: none;">
                                            Forgot password? Click here...
                                        </a4j:commandLink>
                                    </td></tr>
                            </table>
                        </div>
                    </div>
                </h:form>
                <!--//Noi dung se them vao o day -->
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->


            <rich:modalPanel id="insertPanel" autosized="true" width="300">
                <f:facet name="header">
                    <h:outputLabel value=" Lost password ? "/>
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
                        <fieldset class="grey-bg no-margin">                                                       
                            <table cellpadding="5" cellspacing="5">
                                <tr>
                                    <td align="right"><label for="recovery-username">Enter your username: </label></td>
                                    <td><h:inputText id="username1" styleClass="full-width" value="#{LoginBC.username1}"/></td>
                                </tr>
                                <tr>
                                    <td align="right"><label for="recovery-mail">Enter your e-mail: </label></td>
                                    <td><h:inputText id="email" styleClass="full-width" value="#{LoginBC.email}"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right">
                                        <a4j:commandButton styleClass="khungSave3"   value=" Recovery password " action="#{LoginBC.recoveryPassword}"
                                                           reRender="main" oncomplete="#{rich:component('deletePanel')}.show();#{rich:component('insertPanel')}.hide();"/>
                                    </td>
                                </tr>
                            </table>                        
                    </fieldset>
                    <div style="clear: both;"></div>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--OK Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Password sent!" />
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
                        <h:outputLabel value="Password sent your email!"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="   Thank you    "  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>