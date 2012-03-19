<%--
    Document   : newsAll
    Created on : Oct 11, 2011, 3:07:04 PM
    Author     : Nguyen Dang Hoan
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
    <img src="images/psd/newsall.png"/>
    <h:form>
        <a4j:outputPanel id="tableNewsAll">
            <rich:dataGrid value="#{NewsBC.listNewsByType}" var="allListNews" columns="0" elements="8" styleClass="faqKhung"
                           columnClasses="khung0" border="0" style="background: none; border: 0;"
                           footerClass="khung0">
               <div style="border-bottom: 1px #654c3d dashed; padding: 5px; width: 680px;">
               <div class="tieudenews">
                    <a4j:commandLink action="#{navigation.chuyenTrangNewsDetail}" reRender="contentGuest"
                                     style="text-decoration:none;">
                        <h:outputText style="text-decoration:none; color: #654c3d;" value="#{allListNews.newsTitle}" />
                        <f:setPropertyActionListener value="#{allListNews}" target="#{navigation.news}"/>
                    </a4j:commandLink>
                </div>
                <div>
                    <div class="hinhtrai">
                        <h:graphicImage url="#{allListNews.newsImage}" id="icon" alt="#{allListNews.newsImage}" style="width: 190px;"/>
                    </div>
                    <div class="khungphai">
                        <p>News type:
                            <strong>
                                <h:outputLabel value="#{allListNews.newsTypes.typeName}">
                                </h:outputLabel>
                            </strong>
                        </p>
                        <div class="gioithieu1">
                            <h:outputLabel  value="#{allListNews.newsQuote}">
                            </h:outputLabel>
                        </div>
                        <div style="text-align: right; margin-top: 5px;">
                            <a4j:commandLink action="#{navigation.chuyenTrangNewsDetail}" reRender="contentGuest" >
                                <h:graphicImage url="images/psd/view.png"/>
                                <f:setPropertyActionListener value="#{allListNews}" target="#{navigation.news}"/>
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