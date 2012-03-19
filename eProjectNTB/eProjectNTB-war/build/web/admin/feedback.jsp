<%-- 
    Document   : feedback
    Created on : Oct 14, 2011, 10:22:09 AM
    Author     : Nguyen Dang Hoan
--%>

<%@page import="Helpers.ThaoTacSession"%>
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
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <p:resources/>
            <link href="primefaces-bluesky/theme.css" rel="stylesheet" type="text/css"/>
            <title>Feedback</title>
        </head>
        <body>
            <!-- Check administrator logged in or yet -->
            <%
                        Object o = ThaoTacSession.layXuong("MOD");
                        if (o == null) {
                            response.sendRedirect("login.jsp");
                        }
            %>
            <jsp:include page="../style/s_FAQs.jsp" flush="true"/>
        <section class="grid_12" style="width: 98%;">
            <div class="block-border"><div class="block-content">
                    <h1>List FAQs</h1>
                    <!--Noi dung se them vao o day -->

                    <a4j:outputPanel ajaxRendered="true" >
                        <p:growl id="growl" showDetail="true" life="5000" />
                    </a4j:outputPanel>
                    <h:form>
                        <rich:panel style="width:100%; align:center;" id="main">
                            <a4j:outputPanel id="tableLocation" ajaxRendered="true">
                                <rich:dataTable rows="20" id="listFeedback" onRowMouseOver="this.style.backgroundColor='#F1F1F1'"
                                                onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"
                                                cellpadding="0" cellspacing="0" rowKeyVar="row" width="100%"
                                                style="height:auto; font-size:12px;" border="0" var="rowFeedback" value="#{FeedbackBC.listFeedback}">
                                    <rich:column style="width:5px;">
                                        <f:facet name="header">
                                            <h:outputLabel value="No." />
                                        </f:facet>
                                        <h:outputLabel value="#{row+1}" />
                                    </rich:column>
                                    <rich:column style="width:150px;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Email" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowFeedback.feedbackEmail}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Subject" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowFeedback.feedbackSubject}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Detail" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowFeedback.feedbackDetail}" />
                                    </rich:column>
                                    <rich:column style="width:auto;" >
                                        <f:facet name="header">
                                            <h:outputLabel value="Anwser" />
                                        </f:facet>
                                        <h:outputLabel value="#{rowFeedback.feedbackAnswer}" />
                                    </rich:column>

                                    <rich:column width="50px">
                                        <f:facet name="header">
                                            <h:outputLabel value="Command" />
                                        </f:facet>
                                        <a4j:commandLink id="updateLink"
                                                         oncomplete="#{rich:component('updatePanel')}.show()"
                                                         action="#{FeedbackBC.setFeedbackIDToSession}" >
                                            <h:graphicImage value="/images/edit.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowFeedback}" target="#{FeedbackBC.feedback}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="updateLink" value="Update News Type" />
                                        <a4j:commandLink id="deleteLink"
                                                         oncomplete="#{rich:component('deletePanel')}.show()"
                                                         action="#{FeedbackBC.setFeedbackToSession}" >
                                            <h:graphicImage value="/images/delete.gif" style="border:0;height:20px;width:20px;"/>
                                            <f:setPropertyActionListener value="#{rowFeedback}" target="#{FeedbackBC.feedback}" />
                                        </a4j:commandLink>
                                        <rich:toolTip for="deleteLink" value="Delete feedback" />
                                    </rich:column>

                                    <f:facet name="footer">
                                        <rich:datascroller renderIfSinglePage="true" maxPages="5"/>
                                    </f:facet>
                                </rich:dataTable>

                            </a4j:outputPanel>
                        </rich:panel>
                    </h:form>

                    <!--//Noi dung se them vao o day -->
                </div></div>
        </section>
        <div class="clear"></div>
        <jsp:include page="../style/adminFooter.jsp" flush="true"/>


        <!--Update FAQs Panel-->
        <rich:modalPanel id="updatePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Update Feedback Panel" />
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
                        <h:panelGrid columns="1">

                            <h:outputLabel value="Subject (*) :  " styleClass="khungchu"/>                                                      
                            <h:inputTextarea cols="62" rows="1" value="#{FeedbackBC.feedback.feedbackSubject}"
                                             required="Please enter subject" id="subj">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="subj" style="color:red;"/> 
                            <h:outputLabel value="Email (*) :  " styleClass="khungchu"/>
                            <h:inputTextarea cols="62" rows="1" value="#{FeedbackBC.feedback.feedbackEmail}"
                                             id="fbemail">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="fbemail" style="color:red;"/>
                            <h:outputLabel value="Detail (*) :  " styleClass="khungchu"/>
                            <h:inputTextarea cols="62" rows="8" value="#{FeedbackBC.feedback.feedbackDetail}"
                                             id="fbDetail">
                                <rich:ajaxValidator event="onblur"/>
                            </h:inputTextarea>
                            <rich:message for="fbDetail" style="color:red;"/>
                            <h:outputLabel value="Answer :  " styleClass="khungchu"/>
                            <h:inputTextarea cols="62" rows="8" value="#{FeedbackBC.feedback.feedbackAnswer}">
                                <rich:beanValidator summary="Message"/>
                            </h:inputTextarea>
                            <a4j:commandButton value=" Answer and send mail " action="#{FeedbackBC.updateFeedback}" reRender="main"
                                               oncomplete="if(#{FeedbackBC.errors==0})#{rich:component('updatePanel')}.hide();"
                                               styleClass="khungSave2"/>

                        </h:panelGrid>
                    </h:panelGrid>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>


        <!--Delete Sure Question When Delete FAQs Panel-->
        <rich:modalPanel id="deletePanel" autosized="true" width="400">
            <f:facet name="header">
                <h:outputLabel value="Delete Feedback Panel" />
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
                        <h:outputLabel value="Are you sure to delete this Feedback ?"/>
                        <h:panelGrid columns="2" style="text-align:center">
                            <a4j:commandButton size="50" value="Yes" action="#{FeedbackBC.deleteFeedback}" reRender="main" oncomplete="#{rich:component('deletePanel')}.hide();" />
                            <a4j:commandButton size="50" value="No"  oncomplete="#{rich:component('deletePanel')}.hide();" />
                        </h:panelGrid>
                    </center>
                </a4j:outputPanel>
            </h:form>
        </rich:modalPanel>
    </body>
</html>
</f:view>
