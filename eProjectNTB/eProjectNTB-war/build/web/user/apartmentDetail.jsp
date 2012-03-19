<%--
    Document   : apartmentDetail
    Created on : Oct 22, 2011, 9:53:17 AM
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

<f:subview id="newsDetailUser">
    <img src="images/psd/detail.png"/>
    <div class="tieudenews">       
        <h:outputText value="#{apartmentDetail.apartment.floors.buildings.buildingName}"/>
    </div>
    <div style="color: #333333;font-family:Arial, Helvetica, sans-serif; font-size: 16px;">
        <div class="gioithieu2" style="width: 670px;">
            <rich:dataGrid value="#{apartmentDetail.apartment.imageListsList}" var="article"  columns="3" border="0"
                           styleClass="faqKhung" style="background: none; border: 0;width: 670px; text-align:center;" columnClasses="khungnho">
                <h:graphicImage url="#{article.imageList}" style="max-width:220px; max-height:300px;"/>
            </rich:dataGrid>
            <div style="clear: both;"><strong><h:outputText value="Apartment type: #{apartmentDetail.apartment.apartmentTypes.typeName}"/></strong></div>
        </div>
        <div class="gioithieu2" style="width: 670px;">
            <table cellpadding="10" cellspacing="10">
                <tr>
                    <td width="150">Floor Number :</td>
                    <td width="150"><strong><h:outputText value="#{apartmentDetail.apartment.floors.floorNumber}"/></strong></td>
                    <td width="150">Apartment ID :</td>
                    <td width="150"><strong><h:outputText value="#{apartmentDetail.apartment.apartmentID}"/></strong></td>
                </tr>
                <tr>
                    <td>City :</td>
                    <td><strong><h:outputText value="#{apartmentDetail.apartment.floors.buildings.lands.locations.cityName}"/></strong></td>
                    <td>Country :</td>
                    <td><strong><h:outputText value="#{apartmentDetail.apartment.floors.buildings.lands.locations.countries.countryName}"/></strong></td>
                </tr>
                <tr>
                    <td>Area :</td>
                    <td><strong><h:outputText value="#{apartmentDetail.apartment.area}"/> m²</strong></td>
                    <td>Price / m² :</td>
                    <td><strong><h:outputText value="#{apartmentDetail.apartment.floors.price}"/>$</strong></td>
                </tr>
                <tr>
                    <td>Apartment Price :</td>
                    <td><strong><h:outputText value="#{apartmentDetail.apartmentPrice}"/>$</strong></td>
                    <td>Sitting Room :</td>
                    <td><strong><h:outputText value="#{apartmentDetail.apartment.sittingRoom}"/></strong></td>
                </tr>
                <tr>
                    <td>Bed Room :</td>
                    <td><strong><h:outputText value="#{apartmentDetail.apartment.bedRoom}"/></strong></td>
                    <td>Kitchen :</td>
                    <td><strong><h:outputText value="#{apartmentDetail.apartment.kitchen}"/></strong></td>
                </tr>
                <tr>
                    <td>Toilet :</td>
                    <td colspan="3"><strong><h:outputText value="#{apartmentDetail.apartment.toilet}"/></strong></td>
                </tr>
                <tr>
                    <td>Properties :</td>
                    <td colspan="3"><strong><h:outputText value="#{apartmentDetail.apartment.otherProperties}"/></strong></td>
                </tr>
            </table>
        </div>
        <div style="clear: both;"></div>
        <div align="center" style="width: 680px;"><a href="contactUs.jsp"><img src="images/psd/btncontact.png" border="0"/></a></div>
    </div>

    <br/><br/>
    <img src="images/psd/article.png"/>
    <rich:dataGrid value="#{apartmentDetail.apartment.articlesList}" var="article"  columns="0" border="0"
                   styleClass="faqKhung" columnClasses="khung0" style="background: none; border: 0;" rendered="true">
        <h:outputText styleClass="tieude" value=" #{article.articleID}. #{article.articleTitle}"/>
        <div class="gioithieu2">
            <p:panel style="border: 0;padding-left: 10px;">
                <h:outputLabel  styleClass="khungfaqs" value="#{article.articleContent}"/>
            </p:panel>
        </div>
    </rich:dataGrid>
</f:subview>
