<%-- 
    Document   : index
    Created on : Oct 8, 2011, 10:51:10 PM
    Author     : Nguyen Dang Hoan
--%>

<%@page import="Helpers.ThaoTacSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <jsp:include page="../style/adminMeta.jsp" flush="true"/>
            <title>AdminPage</title>
        </head>
        <body>
            <!-- Check administrator logged in or yet -->
            <%
                        Object o = ThaoTacSession.layXuong("MOD");
                        if (o == null) {
                            response.sendRedirect("login.jsp");
                        }
            %>
            <jsp:include page="../style/adminHeader.jsp" flush="true"/>

            <section class="grid_12" style="width: 96%;">
			<div class="block-border"><div class="block-content">
				<h1>Control panel</h1>

                                <h3>FAQs</h3>
				<ul class="shortcuts-list">					
					<li><a href="FAQsInsert.jsp">
						<img src="images/icons/web-app/48/Add.png" width="48" height="48"> Insert FAQs
					</a></li>
                                        <li><a href="FAQsList.jsp">
						<img src="images/icons/web-app/48/Pie-Chart.png" width="48" height="48"> List FAQs
					</a></li>
				</ul>

                                <h3>Feedback</h3>
				<ul class="shortcuts-list">
					<li><a href="feedback.jsp">
						<img src="images/icons/web-app/48/Comment.png" width="48" height="48"> Feedback list
					</a></li>
				</ul>

                                <h3>News</h3>
				<ul class="shortcuts-list">
					<li><a href="newsTypeList.jsp">
						<img src="images/icons/web-app/48/Modify.png" width="48" height="48"> News Type
					</a></li>
					<li><a href="newsInsert.jsp">
						<img src="images/icons/web-app/48/Add.png" width="48" height="48"> Insert News
					</a></li>
                                        <li><a href="newsList.jsp">
						<img src="images/icons/web-app/48/Modify.png" width="48" height="48"> News List
					</a></li>
				</ul>


				<h3>FAQs</h3>
				<ul class="shortcuts-list">
					<li><a href="#">
						<img src="images/icons/web-app/48/Bar-Chart.png" width="48" height="48"> Stats
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Comment.png" width="48" height="48"> Comments
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Email.png" width="48" height="48"> Mail
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Delete.png" width="48" height="48"> Exit
					</a></li>
				</ul>

				<h3>Content management</h3>
				<ul class="shortcuts-list">
					<li><a href="#">
						<img src="images/icons/web-app/48/Modify.png" width="48" height="48"> Write
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Profile.png" width="48" height="48"> My profile
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Search.png" width="48" height="48"> Search
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Add.png" width="48" height="48"> Add post
					</a></li>
				</ul>

				<h3>System</h3>
				<ul class="shortcuts-list">
					<li><a href="#">
						<img src="images/icons/web-app/48/Info.png" width="48" height="48"> Settings
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Loading.png" width="48" height="48"> Monitoring
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Picture.png" width="48" height="48"> Images
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Pie-Chart.png" width="48" height="48"> Usage
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Print.png" width="48" height="48"> Print report
					</a></li>
					<li><a href="#">
						<img src="images/icons/web-app/48/Save.png" width="48" height="48"> Backup
					</a></li>
				</ul>
			</div></div>
		</section>

		<div class="clear"></div>

            <jsp:include page="../style/adminFooter.jsp" flush="true"/>
        </body>
    </html>
</f:view>
