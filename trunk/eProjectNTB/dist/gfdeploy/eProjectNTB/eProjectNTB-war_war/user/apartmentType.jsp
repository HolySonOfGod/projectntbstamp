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
    <img src="images/psd/type.png"/>
    <h:form>
        <rich:dataGrid border="0" value="#{ApartmentTypeBC.listApartmentType}" var="apartmentType"  columns="0"
                       width="160px" columnClasses="khung0"
                       style="background: none; border: 0;">
            <div style="border-bottom: 1px #654c3d dashed; padding: 3px; width: 160px;">
                <a4j:commandLink styleClass="khungmenu1" style="text-decoration:none; color: #654c3d;"
                                 action="#{navigation.chuyentrangApartmentList}"
                                 reRender="contentGuest" >
                    <f:setPropertyActionListener value="#{apartmentType}" target="#{navigation.apartmentType}"/>
                    <h:outputText style="text-decoration:none; color: #654c3d; font-size: 14px;" value="#{apartmentType.typeName}" />
                </a4j:commandLink>
            </div>
        </rich:dataGrid>
    </h:form>
</f:subview>
