<%-- 
    Document   : FAQsInsert
    Created on : Oct 15, 2011, 7:25:11 PM
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

<f:subview id="feedbackInsert">
    <img src="images/psd/support.png"/>
    <p><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='ymsgr:sendim?hoan1208'><img src='http://mail.opi.yahoo.com/online?u=hoan1208&t=2' border=0/></a>
    <br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='ymsgr:sendim?dienkhung87'><img src='http://mail.opi.yahoo.com/online?u=dienkhung87&t=2' border=0/></a>
    <br/><br/>
    </p>

    <img src="images/psd/feedback.png"/>
    <h:form>
        <a4j:outputPanel ajaxRendered="true">
            <p:growl id="growlLocation" showDetail="true" life="2000" showSummary="false" globalOnly="true" />
        </a4j:outputPanel>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a4j:commandLink id="insertButton"
                         oncomplete="#{rich:component('insertPanel')}.show()">
            <h:graphicImage value="images/feedback-icon.png" style="border:0; width: 100px;"/>
        </a4j:commandLink>
        <br/><br/>
    </h:form>
    <!--Insert New Country Panel-->
    <rich:modalPanel id="insertPanel" autosized="true" width="400">
        <f:facet name="header">
            <h:outputLabel value=" Feedback "/>
        </f:facet>
        <f:facet name="controls">
            <h:panelGroup>
                <h:graphicImage value="/images/delete.png" id="closeInsert"
                                styleClass="hidelink" style="width:18px;height:18px" />
                <rich:componentControl for="insertPanel" attachTo="closeInsert"
                                       operation="hide" event="onclick"/>
            </h:panelGroup>
        </f:facet>
        <h:form>
            <a4j:outputPanel ajaxRendered="true">
                <h:panelGrid columns="1">
                    <h:panelGrid columns="1">
                        <h:outputLabel value="Your email:  " styleClass="khungchu"/>
                        <h:inputText value="#{FeedbackBC.feedback.feedbackEmail}" maxlength="100" size="78"
                                     id="fbe">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputText>
                        <rich:message for="fbe" style="color:red; font-size:12px;"/>
                        <h:outputLabel value="Subject:  " styleClass="khungchu"/>
                        <h:inputText value="#{FeedbackBC.feedback.feedbackSubject}" maxlength="100" size="78"
                                     id="fbs">
                            <rich:ajaxValidator event="onblur" />
                        </h:inputText>
                        <rich:message for="fbs" style="color:red; font-size:12px;"/>
                        <h:outputLabel value="Content:  " styleClass="khungchu"/>
                        <h:inputTextarea cols="80" rows="8" value="#{FeedbackBC.feedback.feedbackDetail}"
                                         id="fbd">
                            <rich:ajaxValidator event="onblur"/>
                        </h:inputTextarea>
                        <rich:message for="fbd" style="color:red; font-size:12px;"/>
                        <a4j:commandButton value=" Send feedback " action="#{FeedbackBC.createFeedback}" reRender="main"
                                           oncomplete="if(#{FeedbackBC.errors==0}){#{rich:component('deletePanel')}.show();#{rich:component('insertPanel')}.hide();}" styleClass="khungSave1"/>
                    </h:panelGrid>
                </h:panelGrid>
            </a4j:outputPanel>
        </h:form>
    </rich:modalPanel>


    <!--Delete Sure Question When Delete News Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Feedback sent!" />
            </f:facet>
            <f:facet name="controls">
                <h:panelGroup>
                    <h:graphicImage value="/images/delete.png" id="closeDelete" styleClass="hidelink" style="width:18px;height:18px"/>
                    <rich:componentControl for="deletePanel" attachTo="closeDelete" operation="hide" event="onclick"/>
                </h:panelGroup>
            </f:facet>
            <h:form>
                <a4j:outputPanel ajaxRendered="true">
                    <center>
                        <h:outputLabel value="Feedback sent! Thank you!"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="   Thank you    "  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
</f:subview>
