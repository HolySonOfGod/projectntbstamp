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
            <title>FAQs</title>
            <jsp:include page="../style/meta.jsp" flush="true"/>
        </head>
        <body id="page3" onload="new ElementMaxHeight();">
            <jsp:include page="../style/u_FAQs.jsp" flush="true"/>
            <div class="ndtrai">
                <jsp:include page="feedbackInsert.jsp" flush="true"/>
            </div><div class="ndphai">
                <img src="images/psd/FAQs.png"/>
                <br/>
                <rich:dataGrid value="#{FAQsBC.listFAQ}" var="faqGuest" columns="0" border="0"
                                styleClass="faqKhung" columnClasses="khung0" style="background: none; border: 0;">
                    <h:outputText styleClass="tieude" value="#{faqGuest.question}" />
                    <p:panel style="border: 0;padding-left: 10px;">
                        <h:outputLabel styleClass="khungfaqs" value="#{faqGuest.answer}">
                        </h:outputLabel>
                    </p:panel>

                </rich:dataGrid>
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>
        </body>
    </html>
</f:view>
