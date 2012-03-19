<%-- 
    Document   : adminHeader
    Created on : Oct 5, 2011, 2:16:16 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:subview id="adminHeader">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
        <body>

            <div id="nav">
                <h:form>
                    <ul>
                        <li><h:commandLink action="rolepage" value="Roles Page"/></li>
                        <li><h:commandLink action="accountpage" value="Accounts Page"/></li>
                        <li><h:commandLink action="countrypage" value="Countries Page"/></li>
                        <li><h:commandLink action="locationpage" value="Locations Page"/></li>
                    </ul>
                </h:form>
            </div>

        </body>
    </html>
</f:subview>
