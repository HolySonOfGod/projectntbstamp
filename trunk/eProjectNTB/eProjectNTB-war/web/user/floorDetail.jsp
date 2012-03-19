<%-- 
    Document   : floorDetail
    Created on : Oct 22, 2011, 1:14:10 PM
    Author     : NguyenHung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich" %>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j" %>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui" %>

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Floor</title>
            <jsp:include page="../style/meta.jsp" flush="true"/>
        </head>
        <body id="page3" onload="new ElementMaxHeight();">
            <jsp:include page="../style/u_FAQs.jsp" flush="true"/>
            <div class="ndtrai">
                <jsp:include page="menu.jsp" flush="true"/>
                <br/>
                <jsp:include page="feedbackInsert.jsp" flush="true"/>
            </div><div class="ndphai">
                <img src="images/psd/floor.png"/>
                <br/>
               <a4j:outputPanel id="floorTable">
                <h:form>
                        <rich:dataTable rows="10" id="listFloor" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                        onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                        cellpadding="0" cellspacing="0" rowKeyVar="row" width="680px"
                                        style="height:auto;text-align:center" border="0" var="rowFloor" value="#{FloorBC.listFloor}">

                                    <f:facet name="header">
                                        <rich:columnGroup>
                                            <rich:column>
                                                <h:outputLabel value="Building name" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Floor number"/>
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Number Of Apartment" />
                                            </rich:column>
                                            <rich:column>
                                                <h:outputLabel value="Price" />
                                            </rich:column>
                                        </rich:columnGroup>
                                    </f:facet>

                            <rich:column style="width:390px;" filterMethod="#{FloorFilter.filteringFloorByBuildingName}">
                                        <f:facet name="header">
                                            <h:selectOneMenu value="#{FloorFilter.buildingIDFilter}">
                                                <f:selectItem itemLabel="Select a building name" itemValue="0"/>
                                                <f:selectItems value="#{FloorBC.listBuildingName}"/>
                                                <a4j:support event="onchange" reRender="floorTable" ajaxSingle="true"/>
                                            </h:selectOneMenu>
                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.buildings.buildingName}" />
                                    </rich:column>


                                    <rich:column style="width:100px;" filterMethod="#{FloorFilter.filteringFloorByFloorNumber}">
                                        <f:facet name="header">
                                            <h:inputText id="FNFilter" value="#{FloorFilter.floorNumber}" required="true" requiredMessage="This field can't be blank"
                                                         size="15"  style="width:100px;">
                                                <a4j:support event="onchange" reRender="floorTable" ajaxSingle="true"/>
                                            </h:inputText>
                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.floorNumber}" />
                                    </rich:column>

                                    <rich:column style="width:100px;" filterMethod="#{FloorFilter.filteringFloorByNOA}">
                                        <f:facet name="header">
                                            <h:inputText id="NOAFilter" value="#{FloorFilter.numberOfApartment}" required="true" requiredMessage="This field can't be blank"
                                                         size="15" style="width:100px;">
                                                <a4j:support event="onchange" reRender="floorTable" ajaxSingle="true"/>
                                            </h:inputText>

                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.numberOfApartment}" />
                                    </rich:column>

                                    <rich:column style="width:100px;" filterMethod="#{FloorFilter.filteringFloorByPrice}" >
                                        <f:facet name="header">
                                            <h:inputText id="priceFilter" value="#{FloorFilter.price}" required="true" requiredMessage="This field can't be blank"
                                                         size="15"  style="width:100px;">
                                                <a4j:support event="onchange" reRender="floorTable" ajaxSingle="true"/>
                                            </h:inputText>

                                        </f:facet>
                                        <h:outputLabel value="#{rowFloor.price}" />
                                    </rich:column>
                        </rich:dataTable>
                        <br/>
                        <center> <a4j:commandButton value="Reset floor table" action="#{FloorFilter.resetFloorTable}" reRender="floorTable"/>
                        </center>
                    
                </h:form>
             </a4j:outputPanel>
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>
        </body>
    </html>
</f:view>
