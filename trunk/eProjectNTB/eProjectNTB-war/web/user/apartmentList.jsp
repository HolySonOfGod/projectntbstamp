<%-- 
    Document   : ApartmentList
    Created on : Oct 20, 2011, 9:11:14 AM
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

<f:subview id="newsListUser">
    <img src="images/psd/apartment.png"/><br/>
    <h:form>
        <a4j:outputPanel id="tableNewsAll">
            <rich:dataGrid value="#{ApartmentBC.listApartmentsByType}" var="allapartList" columns="0" elements="8" styleClass="faqKhung"
                           columnClasses="khung0" border="0" style="background: none; border: 0;"
                           footerClass="khung0">
                <div style="border-bottom: 1px #654c3d dashed; padding: 5px; width: 680px;">
                    <div class="tieudenews">
                        <a4j:commandLink action="#{navigation.chuyenTrangApartmentDetail}" reRender="contentGuest"
                                         style="text-decoration:none;">
                            <h:outputText style="text-decoration:none; color: #654c3d;"
                                          value="#{allapartList.floors.buildings.buildingName}" />
                            <f:setPropertyActionListener value="#{allapartList}" target="#{navigation.apartment}"/>
                        </a4j:commandLink>
                    </div>
                    <div>
                        <div class="hinhtrai">
                            <rich:dataTable value="#{allapartList.imageListsList}" var="article"  columns="0" border="0"
                                           styleClass="faqKhung" columnClasses="khung0" style="background: none; border: 0;"
                                           rows="1">
                                <rich:column>
                                    <h:graphicImage url="#{article.imageList}" style="max-width:190px; max-height:200px;"/>
                                </rich:column>
                            </rich:dataTable>
                        </div>
                        <div class="khungphai">
                            <p>Type: <h:outputText style="text-decoration:none; color: #654c3d;" value="#{allListapartment.apartmentTypes.typeName}" />
                                <br/>
                                <div class="gioithieu1">
                                    <h:outputLabel value="#{allapartList.otherProperties}">
                                    </h:outputLabel>
                                </div>
                            </p>
                            <p>Area Apartment:
                                <strong>
                                    <h:outputLabel value="#{allapartList.area}"> m²
                                    </h:outputLabel>
                                </strong>
                            </p>
                            <div style="text-align: right; margin-top: 5px;">
                                <a4j:commandLink action="#{navigation.chuyenTrangApartmentDetail}" reRender="contentGuest" >
                                    <h:graphicImage url="images/psd/view.png"/>
                                    <f:setPropertyActionListener value="#{allapartList}" target="#{navigation.apartment}"/>
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