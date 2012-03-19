<%-- 
    Document   : paymentMode
    Created on : Oct 24, 2011, 12:25:33 AM
    Author     : Administrator
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
            <title>Payment Mode</title>
            <jsp:include page="../style/meta.jsp" flush="true"/>
        </head>
        <body id="page3" onload="new ElementMaxHeight();">
            <jsp:include page="../style/u_FAQs.jsp" flush="true"/>
            <div class="ndtrai">
                <jsp:include page="menu.jsp" flush="true"/>
                <br/>
                <jsp:include page="feedbackInsert.jsp" flush="true"/>
            </div><div class="ndphai">
                <img src="images/psd/payment.png"/>
                <br/>
                <rich:dataGrid value="#{PaymentModeBC.listPaymentMode}" var="paymentmode" columns="0" border="0"
                               styleClass="faqKhung" columnClasses="khung0" style="background: none; border: 0;">
                    <div class="noidungnews" style="margin-top: 5px; margin-bottom: 5px;">
                        <h:outputText styleClass="tieude" value="#{paymentmode.paymentModeName}" />
                        <div style="border: 0;padding:10px 10px 10px 10px;">
                            <b>Installment:</b> <h:outputLabel styleClass="khungfaqs" value="#{paymentmode.installment}">
                            </h:outputLabel>
                        </div>

                        <div style="border: 0;padding:0 10px 0 10px;">
                            <b>Interest:</b> <h:outputLabel styleClass="khungfaqs" value="#{paymentmode.interest}">
                            </h:outputLabel>
                        </div>
                    </div>
                </rich:dataGrid>
            </div>
            <jsp:include page="../style/footer.jsp" flush="true"/>
        </body>
    </html>
</f:view>
