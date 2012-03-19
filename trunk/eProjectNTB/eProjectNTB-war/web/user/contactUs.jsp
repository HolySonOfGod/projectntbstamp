<%--
    Document   : faqView
    Created on : Oct 7, 2011, 2:52:23 PM
    Author     : Nguyen Dang Hoan
--%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich" %>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j" %>
<%@taglib prefix="p" uri="http://primefaces.prime.com.tr/ui" %>

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Contact us</title>
            <jsp:include page="../style/meta.jsp" flush="true"/>
        </head>
        <body id="page3" onload="new ElementMaxHeight();">
            <jsp:include page="../style/u_Contact.jsp" flush="true"/>
            <div class="ndtrai">
                <jsp:include page="feedbackInsert.jsp" flush="true"/>
            </div><div class="ndphai">
                <img src="images/psd/contact.png"/>
                <br/>
                <div style="padding: 5px; color: #333333; background: #FFFFFF; border: 2px solid #999999; width: 685px;">
                    <strong>Introduction:</strong>
                    <br/>
                    Our client, <b>National Territory Builders (NTB)</b> is one of the famous builders in the territory,
                    who constructs the buildings for residential and the commercial purposes, and takes up the
                    contracts for and supervising the constructions or repair or re-modeling of the houses or buildings
                    or complexes or offices. Once the buildings are constructed, they advertise about the buildings
                    constructed, with the help of the hoardings, new papers, etc. so that they reach out for the customers,
                    who might be interested in owning (purchasing) the same from the builder.
                </div>
                <div style="border-top: 1px #25a0d8 solid; height: 5px; margin-top: 5px; width: 695px;"></div>
                <h:form>                    
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
                            <a4j:commandLink action="#{FeedbackBC.contactus}" reRender="main"
                                             oncomplete="if(#{FeedbackBC.errors==0}){#{rich:component('deletePanel')}.show();#{rich:component('insertPanel')}.hide();}" styleClass="khungSave1">
                                <h:graphicImage value="images/psd/send.png" style="border:0; width: 100px;"/>
                            </a4j:commandLink>
                        </h:panelGrid>
                    </h:panelGrid>
                </h:form>
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>


            <rich:modalPanel id="deletePanel" autosized="true" width="400">
                <f:facet name="header">
                    <h:outputLabel value="Contact sent!" />
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
                            <h:outputLabel value="Contact sent! Thank you!"/>
                            <h:panelGrid columns="2" style="text-align:center">
                                <a4j:commandButton size="50" value="   Thank you    "  oncomplete="#{rich:component('deletePanel')}.hide();" />
                            </h:panelGrid>
                        </center>
                    </a4j:outputPanel>
                </h:form>
            </rich:modalPanel>
        </body>
    </html>
</f:view>
