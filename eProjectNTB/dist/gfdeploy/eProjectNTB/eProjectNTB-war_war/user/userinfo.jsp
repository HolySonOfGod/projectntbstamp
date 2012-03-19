<%-- 
    Document   : userinfo
    Created on : Oct 25, 2011, 9:50:45 PM
    Author     : Administrator
--%>

<%@page import="Helpers.ThaoTacSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui"%>

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
        <body>
            <!-- Check user logged in or yet -->
            <%          Object o = ThaoTacSession.layXuong("USER");
                        if (o == null) {
                            response.sendRedirect("login.jsp");
                        }
            %>

        <body id="page3" onload="new ElementMaxHeight();">
            <jsp:include page="../style/u_Contract.jsp" flush="true"/>
            <div class="ndtrai">
                <img src="images/psd/loginmenu.png"/>
                <div style=" padding: 3px; width: 160px; padding-top: 6px; text-align: center; font-size: 18px; font-weight: bold; color: #b15630;">
                Hi <%= ThaoTacSession.layXuong("USER").toString() %>
                </div>
                <img src="images/psd/menu.png"/>
                <h:form>
                    <jsp:include page="editUser.jsp" flush="true"/>
                    <!--<div style="border-bottom: 1px #654c3d dashed; padding: 3px; width: 160px; padding-top: 6px;">
                        <a Class="khungmenu1" style="text-decoration:none; color: #654c3d;" href="editUser.jsp">EDIT INFO</a>
                    </div>-->
                    <div style="border-bottom: 1px #654c3d dashed; padding: 3px; width: 160px; padding-top: 6px;">
                        <h:commandLink action="#{LoginBC.homeLogout}" title="Logout" styleClass="khungmenu1"
                                        style="text-decoration:none; color: #654c3d;font-size: 14px;font-family:Arial, Helvetica, sans-serif;padding-left:11px; " value="LOGOUT">
                        </h:commandLink>
                    </div>
                </h:form>
                <br/><br/>
                <jsp:include page="feedbackInsert.jsp" flush="true"/>
            </div><div class="ndphai">
                <img src="images/psd/contract.png"/>                
                <br/>
                <a4j:include id="contentGuest" viewId="#{navigation.trangContract}"/>
                <!--//Noi dung se them vao o day -->
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
        </body>
    </html>
</f:view>