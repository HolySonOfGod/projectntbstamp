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

<f:subview id="EventTypeUser1">
    <img src="images/psd/menu.png"/>
    <h:form>
        <div style="border-bottom: 1px #654c3d dashed; padding: 3px; width: 160px; padding-top: 6px;">
            <a Class="khungmenu1" style="text-decoration:none; color: #654c3d;" href="apartment.jsp">APARTMENT</a>
        </div>

        <div style="border-bottom: 1px #654c3d dashed; padding: 3px; width: 160px; padding-top: 6px;">
            <a class="khungmenu1" style="text-decoration:none; color: #654c3d;" href="floorDetail.jsp">FLOOR DETAIL</a>
        </div>

        <div style="border-bottom: 1px #654c3d dashed; padding: 3px; width: 160px; padding-top: 6px;">
            <a class="khungmenu1" style="text-decoration:none; color: #654c3d;" href="paymentMode.jsp">PAYMENT MODE</a>
        </div>
        
    </h:form>
</f:subview>
