<%-- 
    Document   : apartmentAll
    Created on : Oct 21, 2011, 10:17:23 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:subview id="newsAllUser">
    <img src="images/psd/apartment.png"/><br/>
    <h:form>
        <a4j:outputPanel id="apartmentTable">
            <h:panelGrid columns="5" width="700px">
                            <h:outputLabel value="Key words:"  style=" color:#000000;"/>
                            <h:inputText id="txtKeyWord" value="#{ApartmentBC.keyWords}" style="color:#000000;"/>
                            <h:outputLabel value="Types:"  style=" color:#000000;"/>
                            <h:selectOneMenu id="searchMenu" value="#{ApartmentBC.searchType}" required="true" requiredMessage="Please choose a type">
                                <f:selectItem itemLabel="Select a type" itemValue="none"></f:selectItem>
                                <f:selectItem itemLabel="Location" itemValue="location"></f:selectItem>
                                <f:selectItem itemLabel="Area" itemValue="area"></f:selectItem>
                                <f:selectItem itemLabel="Apartment price" itemValue="AP"></f:selectItem>
                            </h:selectOneMenu>
                            <h:column>
                                <a4j:commandLink action="#{ApartmentBC.loadApartment}" reRender="apartmentTable">
                                    <img src="images/buttonsearch.png" alt="" />
                                </a4j:commandLink>
                            </h:column>
                            <h:outputLabel value=""/><h:message for="searchMenu"/><h:outputLabel value=""/><h:outputLabel value=""/>
            </h:panelGrid>
                                    <div style="width: 650px; text-align: right;"><a4j:commandLink value="Reset table" action="#{ApartmentBC.loadAllApartment}" reRender="apartmentTable"/><br><br></div>
                                    <hr style="width: 690px;"/>
            <rich:dataGrid value="#{ApartmentBC.listApartment}" var="apartment" columns="0" elements="8" styleClass="faqKhung"
                           columnClasses="khung0" border="0" style="background: none; border: 0;"
                           footerClass="khung0">
                <div style="border-bottom: 1px #654c3d dashed; padding: 5px; width: 680px;">
                    <div class="tieudenews">
                        <a4j:commandLink action="#{navigation.chuyenTrangApartmentDetail}" reRender="contentGuest"
                                         style="text-decoration:none;">                            
                            <h:outputText style="text-decoration:none; color: #654c3d;"
                                          value="#{apartment.floors.buildings.buildingName}" />
                            <f:setPropertyActionListener value="#{apartment}" target="#{navigation.apartment}"/>
                        </a4j:commandLink>
                    </div>
                    <div>
                        <div class="hinhtrai">
                            <rich:dataTable value="#{apartment.imageListsList}" var="article"  columns="0" border="0"
                                           styleClass="faqKhung" columnClasses="khung0" style="background: none; border: 0;"
                                           rows="1">
                                <rich:column>
                                    <h:graphicImage url="#{article.imageList}" style="max-width:190px; max-height:200px;"/>
                                </rich:column>
                            </rich:dataTable>
                        </div>
                        <div class="khungphai">
                            <p><h:outputText style="text-decoration:none; color: #654c3d;" value="Apartment type: #{apartment.apartmentTypes.typeName}" />
                                <br/>
                            <div class="gioithieu1">
                                <b><h:outputLabel value="Apartment area: #{apartment.area}"/>  m²<br>
                                <h:outputLabel value="Price per m²: #{apartment.floors.price}"/>$<br>
                                <h:outputLabel value="Other: #{apartment.otherProperties}"/><br>
                                <h:outputLabel rendered="#{apartment.status == true}" value="Status: Available"/>
                                <h:outputLabel rendered="#{apartment.status == false}" value="Status: Sold"/></b>

                            </div>
                            <div style="text-align: right; margin-top: 5px;">
                                <a4j:commandLink action="#{navigation.chuyenTrangApartmentDetail}" reRender="contentGuest" >
                                    <h:graphicImage url="images/psd/view.png"/>
                                    <f:setPropertyActionListener value="#{apartment}" target="#{navigation.apartment}"/>
                                </a4j:commandLink>
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                    </div><div style="clear:both;"></div>
                </div>
                <f:facet name="footer">
                    <rich:datascroller id="scrt" ajaxSingle="false">
                    </rich:datascroller>
                </f:facet>
            </rich:dataGrid>
        </a4j:outputPanel>
    </h:form>
</f:subview>