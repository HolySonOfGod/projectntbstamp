<%--
    Document   : imageUpload
    Created on : Oct 27, 2011, 10:58:41 AM
    Author     : NguyenHung
--%>

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
            <title>News Insert</title>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <!--//Noi dung se them vao o day -->
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <p:resources/>
        </head>
        <body>
            <!--//Noi dung se them vao o day -->
            <jsp:include page="../style/s_Selling.jsp" flush="true"/>
        <section class="grid_12" style="width: 96%;">
            <div class="block-border"><div class="block-content">
                    <h1>News Insert</h1>
                    <!--//Noi dung se them vao o day -->
                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel id="main">
                            <h:panelGrid columns="1" style="height:auto">
                                <h:outputLabel value="Building name(*):" styleClass="khungchu"/>
                                <h:selectOneMenu id="building" value="#{ImageListBC.buildingID}" styleClass="outputLabel" required="true" requiredMessage="Please select a building">
                                    <a4j:support event="onchange"  action="#{ImageListBC.buildingChanged}" reRender="floor" ajaxSingle="true"/>
                                    <f:selectItem itemLabel="Select a building name"/>
                                    <f:selectItems value="#{ImageListBC.listBuildingName}"/>
                                </h:selectOneMenu>
                                <h:message for="building" style="color:red" />

                                <h:outputLabel value="Floor number (*):" styleClass="khungchu"/>
                                <h:selectOneMenu id="floor" value="#{ImageListBC.floorID}" styleClass="outputLabel" required="true" requiredMessage="Please select a floor">
                                    <a4j:support event="onchange"  action="#{ImageListBC.floorChanged}" reRender="apartment" ajaxSingle="true"/>
                                    <f:selectItem itemLabel="Select a floor number"/>
                                    <f:selectItems value="#{ImageListBC.listFloorNumber}"/>
                                </h:selectOneMenu>
                                <h:message for="floor" style="color:red" />

                                <h:outputLabel value="ApartmentID (*):" styleClass="khungchu" />
                                <h:selectOneMenu id="apartment" value="#{ImageListBC.apartmentID}" styleClass="outputLabel" required="true" requiredMessage="Please select a apartment">
                                    <f:selectItem itemLabel="Select an apartment"/>
                                    <f:selectItems value="#{ImageListBC.listApartment}"/>
                                </h:selectOneMenu>
                                <h:message for="apartment" style="color:red" />

                                <h:outputLabel value="Apartment Image (*):" styleClass="khungchu"/>
                                <rich:fileUpload fileUploadListener="#{ImageListBC.listener}"
                                                 maxFilesQuantity="1"
                                                 id="upload"
                                                 allowFlash="true" immediateUpload="false"
                                                 acceptedTypes="jpg,gif,png,bmp,jpeg"
                                                 listHeight="50" required="true" requiredMessage="Please upload an image"/>

                                <br/><center>
                                    <a4j:commandButton value="            Save              " action="#{ImageListBC.createImageList}"/>
                                </center>
                            </h:panelGrid>
                        </rich:panel>
                    </h:form>
                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        <!--//Noi dung se them vao o day -->
    </body>
</html>
</f:view>
