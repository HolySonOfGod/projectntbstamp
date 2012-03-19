<%-- 
    Document   : login
    Created on : Oct 20, 2011, 2:44:14 PM
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
    <html lang="en">
        <head>

            <title>Constellation Admin Skin</title>
            <meta charset="utf-8">

            <!-- Global stylesheets -->
            <link href="css/reset.css" rel="stylesheet" type="text/css">
            <link href="css/common.css" rel="stylesheet" type="text/css">
            <link href="css/form.css" rel="stylesheet" type="text/css">
            <link href="css/standard.css" rel="stylesheet" type="text/css">
            <link href="css/special-pages.css" rel="stylesheet" type="text/css">
            <link href="css/khung.css" rel="stylesheet" type="text/css">
            <!-- Favicon -->
            <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
            <link rel="icon" type="image/png" href="favicon-large.png">

        </head>

        <!-- the 'special-page' class is only an identifier for scripts -->
        <body class="special-page login-bg dark">
            <a4j:outputPanel ajaxRendered="true">
                <p:growl id="growlFloor" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
            </a4j:outputPanel>
            <!-- The template uses conditional comments to add wrappers div for ie8 and ie7 - just add .ie, .ie7 or .ie6 prefix to your css selectors when needed -->
            <!--[if lt IE 9]><div class="ie"><![endif]-->
            <!--[if lt IE 8]><div class="ie7"><![endif]-->

        <section id="message">
            <div class="block-border"><div class="block-content no-title dark-bg">
                    <p class="mini-infos">For demo website, use <b>admin</b> / <b>123456</b></p>
                </div></div>
        </section>

        <section id="login-block">
            <div class="block-border"><div class="block-content">


                    <div class="block-header">Login Details</div>                    

                    <h:form styleClass="form with-margin" id="login-form">
                        <input type="hidden" name="a" id="a" value="send">
                        <p class="inline-small-label">
                            <label for="login"><span class="big">User name</span></label>
                            <h:inputText id="login" styleClass="full-width" value="#{LoginBC.username}"/>
                        </p>
                        <p class="inline-small-label">
                            <label for="pass"><span class="big">Password</span></label>
                            <h:inputSecret id="pass" styleClass="full-width" value="#{LoginBC.password}"/>
                        </p>

                        <div align="right"><h:commandButton styleClass="khungLogin" value="Login" action="#{LoginBC.userLogin}"/></div>
                    </h:form>
                    <h:form styleClass="form" id="recovery-form">
                        <fieldset class="grey-bg no-margin" style="margin-bottom: -20px;">
                            <legend>Lost password ?</legend>
                            <p class="input-with-button">
                                <label for="recovery-username">Enter your username</label>
                                <h:inputText id="username1" styleClass="full-width" value="#{LoginBC.username1}"/>
                                <label for="recovery-mail">Enter your e-mail address</label>
                                <h:inputText id="email" styleClass="full-width" value="#{LoginBC.email}"/>
                                <a4j:commandButton styleClass="khungLogin1"   value=" Recovery password " action="#{LoginBC.recoveryPassword}"/>
                            </p>
                        </fieldset>
                    </h:form>
                </div></div>
        </section>

        <!--[if lt IE 8]></div><![endif]-->
        <!--[if lt IE 9]></div><![endif]-->
    </body>
</html>

</f:view>
