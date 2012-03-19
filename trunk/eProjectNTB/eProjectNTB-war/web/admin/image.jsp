<%--
    Document   : Apartment Type
    Created on : Oct 15, 2011, 9:04:55 AM
    Author     : NguyenHung
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
            <title>Manage Image Page</title>
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <p:resources/>
        </head>
        <body>
            <!-- TEST -->
            <jsp:include page="../style/s_Selling.jsp" flush="true"/>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border"><div class="block-content">
                    <h1>Manage Image</h1>

                    <a4j:outputPanel ajaxRendered="true">
                        <p:growl id="growlFloor" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
                    </a4j:outputPanel>

                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableImage" ajaxRendered="true">
                                <rich:dataTable rows="10" id="listImage" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto;text-align:center;vertical-align:middle" border="0" var="rowImage" value="#{ImageListBC.listImageList}">

                                    <f:facet name="header">
                                        <h:outputLabel value="Listing Images" />
                                    </f:facet>

                                    <rich:column style="width:20px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="ImageID" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowImage.listID}" />
                                    </rich:column>

                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Image" />
                                        </f:facet>
                                        <h:graphicImage url="../user/#{rowImage.imageList}" style="max-width:150px; max-height:150px;"/>
                                    </rich:column>


                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="ApartmentID" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowImage.apartments.apartmentID}" />
                                    </rich:column>

                                    <rich:column width="70px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>

                                        <a4j:commandLink id="ViewLink"
                                                         oncomplete="#{rich:component('viewPanel')}.show()"
                                                         action="#{ImageListBC.setImageListIDToSession}" >
                                            <h:graphicImage value="/images/view1.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowImage}" target="#{ImageListBC.imageList}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="ViewLink" value="View Apartment Type" />
                                        <!--<a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{ImageListBC.setImageListIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowImage}" target="#{ImageListBC.imageList}" />
                                        </a4j:commandLink>-->
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                          action="#{ImageListBC.setImageListIDToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                             <f:setPropertyActionListener value="#{rowImage}" target="#{ImageListBC.imageList}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete Image" />

                                    </rich:column>
                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>

                                <a4j:commandButton id="insertButton"
                                                   oncomplete="#{rich:component('insertPanel')}.show()"
                                                   value="Insert new Images">
                                </a4j:commandButton>

                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>

                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>

        <rich:modalPanel id="viewPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="View Apartment Type Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/delete.png" id="closeView"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="viewPanel" attachTo="closeView"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="2">
                        <h:outputLabel style="width:70px;" value="ImageID: "/>
                        <h:outputText value="#{ImageListBC.imageList.listID}"/>
                        <h:outputLabel style="width:70px;" value="ApartmentID: "/>
                        <h:outputText value="#{ImageListBC.imageList.apartments.apartmentID}"/>
                        <h:outputLabel style="width:70px;" value="Image: " /><br/>
                        <h:graphicImage url="#{ImageListBC.imageList.imageList}" style="max-width:150px; max-height:150px;"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>

        <!--Insert-->
        <rich:modalPanel id="insertPanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Insert New Image Panel"/>
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/delete.png" id="closeInsert"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="insertPanel" attachTo="closeInsert"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        <h:outputLabel value="Building name(*):" styleClass="khungchu"/>
                                <h:selectOneMenu id="building" value="#{ImageListBC.buildingID}" styleClass="outputLabel" required="true" requiredMessage="Please select a building">
                                    <a4j:support event="onchange"  action="#{ImageListBC.buildingChanged}" reRender="floor" ajaxSingle="true"/>
                                    <f:selectItem itemLabel="Select a building name"/>
                                    <f:selectItems value="#{ImageListBC.listBuildingName}"/>
                                    <rich:ajaxValidator event="onblur"/>
                                </h:selectOneMenu>
                                <h:message for="building" style="color:red" />

                                <h:outputLabel value="Floor number (*):" styleClass="khungchu"/>
                                <h:selectOneMenu id="floor" value="#{ImageListBC.floorID}" styleClass="outputLabel" required="true" requiredMessage="Please select a floor">
                                    <a4j:support event="onchange"  action="#{ImageListBC.floorChanged}" reRender="apartment" ajaxSingle="true"/>
                                    <f:selectItem itemLabel="Select a floor number"/>
                                    <f:selectItems value="#{ImageListBC.listFloorNumber}"/>
                                    <rich:ajaxValidator event="onblur"/>
                                </h:selectOneMenu>
                                <h:message for="floor" style="color:red" />

                                <h:outputLabel value="ApartmentID (*):" styleClass="khungchu" />
                                <h:selectOneMenu id="apartment" value="#{ImageListBC.apartmentID}" styleClass="outputLabel" required="true" requiredMessage="Please select a apartment">
                                    <f:selectItem itemLabel="Select an apartment"/>
                                    <f:selectItems value="#{ImageListBC.listApartment}"/>
                                    <rich:ajaxValidator event="onblur"/>
                                </h:selectOneMenu>
                                <h:message for="apartment" style="color:red" />

                                <h:outputLabel value="Apartment Image (*):" styleClass="khungchu"/>
                                <rich:fileUpload fileUploadListener="#{ImageListBC.listener}"
                                                 maxFilesQuantity="1"
                                                 id="upload"
                                                 allowFlash="true" immediateUpload="false"
                                                 acceptedTypes="jpg,gif,png,bmp,jpeg"
                                                 listHeight="50" required="true" requiredMessage="Please upload an image">
                                    <rich:ajaxValidator event="onblur"/>
                                </rich:fileUpload>
                                <h:message for="upload" style="color:red" />

                                <a4j:commandButton value="Insert" action="#{ImageListBC.createImageList}" reRender="main"
                                           oncomplete="if(#{ImageListBC.errors==0})#{rich:component('insertPanel')}.hide();"
                                           styleClass="khungSave2"/>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!-- Update --->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Update Image Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/delete.png" id="closeUpdate"
                                    styleClass="hidelink" style="width:18px;height:18px" />
                    <rich:componentControl for="updatePanel" attachTo="closeUpdate"
                                           operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <h:panelGrid columns="1">
                        
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

                        <a4j:commandButton value="Update" action="#{ImageListBC.updateImageList}" reRender="main"
                                           oncomplete="if(#{ImageListBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                           styleClass="khungSave2" />

                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!--Delete  Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Image Panel" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="images/delete.png" id="closeDelete" styleClass="hidelink" style="width:18px;height:18px"/>
                    <rich:componentControl for="deletePanel" attachTo="closeDelete" operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <center>
                        <h:outputLabel value="Are you sure to delete this Image ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{ImageListBC.deleteImageList}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>