<%--
    Document   : headeradmin
    Created on : Oct 8, 2011, 10:17:24 PM
    Author     : Nguyen Dang Hoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:subview id="header">
    <!-- The template uses conditional comments to add wrappers div for ie8 and ie7 - just add .ie or .ie7 prefix to your css selectors when needed -->
    <!--[if lt IE 9]><div class="ie"><![endif]-->
    <!--[if lt IE 8]><div class="ie7"><![endif]-->

    <!-- Header -->

    <!-- Server status -->
    <header><div class="container_12">

            <p id="skin-name"><small>CNC Aptech<br> NTB project</small> <strong>1.0</strong></p>
            <div class="server-info">Group: <strong>1</strong></div>
            <div class="server-info">Technology <strong>EJB</strong></div>

        </div></header>
    <!-- End server status -->

    <!-- Main nav -->
    <nav id="main-nav">

        <ul class="container_12">
           
            <li class="stats"><a href="buildingpage.jsp" title="Selling">Selling</a>
                <ul><li class="current"><a href="#" title="Menu">Menu</a></li></ul>
            </li>
            <li class="write"><a href="Contract.jsp" title="Contracts">Contracts</a>
                <ul><li class="current"><a href="#" title="Menu">Menu</a></li></ul>
            </li>
            <li class="comments"><a href="FAQsList.jsp" title="FAQs & Feedback">FAQs&Feedback</a>
                <ul><li class="current"><a href="#" title="Menu">Menu</a></li></ul>
            </li>
            <li class="settings current"><a href="newsList.jsp" title="News">News</a>
                <ul><li class="current"><a href="#" title="Menu">Menu</a></li></ul>
            </li>

        </ul>
    </nav>
    <!-- End main nav -->

    <!-- Sub nav -->
    <div id="sub-nav"><div class="container_12"></div></div>
    <!-- End sub nav -->

    <!-- Status bar -->
    <div id="status-bar"><div class="container_12">

            <ul id="status-infos">
                <li class="spaced">Logged as: <strong>MOD</strong></li>
                <!--li><a href="login.html" class="button red" title="Logout"><span class="smaller">LOGOUT</span></a></li-->
                <li>
                    <h:form>
                        <h:commandLink action="#{LoginBC.userLogout}" styleClass="button red" title="Logout">
                            <span class="smaller">LOGOUT</span>
                        </h:commandLink>
                    </h:form>
                </li>
            </ul>

            <ul id="breadcrumb">
                <li><a href="newsType.jsp" title="List FAQs">News Type</a></li>
                    <li><a href="newsList.jsp" title="Add FAQs">News List</a></li>
                    <li><a href="newsInsert.jsp" title="Add News">Add News</a></li>
            </ul>

        </div></div><div id="header-shadow"></div><br><br><div class="clear"></div>
    </f:subview>
