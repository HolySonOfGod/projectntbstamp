<%--
    Document   : header
    Created on : Oct 7, 2011, 9:04:21 PM
    Author     : Nguyen Dang Hoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
        <head>
            <title>Home</title>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <link href="css/layout.css" rel="stylesheet" type="text/css" />
            <link href="css/style.css" rel="stylesheet" type="text/css" />
            <script src="js/maxheight.js" type="text/javascript"></script>
        </head>
        <body id="page3" onload="new ElementMaxHeight();">
            <div class="main">
                <!--==========header=========== -->
                <div class="flash">
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,24"
                            width="980" height="492">
                        <param name="movie" value="flash/home.swf?button=1" />
                        <param name="quality" value="high" />
                        <param name="menu" value="false" />
                        <!--[if !IE]> <-->
                        <object data="flash/home.swf?button=1"
                                width="980" height="492" type="application/x-shockwave-flash">
                            <param name="quality" value="high" />
                            <param name="menu" value="false" />
                            <param name="pluginurl" value="http://www.macromedia.com/go/getflashplayer" />
                            FAIL (the browser should render some flash content, not this).
                        </object>
                        <!--> <![endif]-->
                    </object>
                </div>
                <div class="header_form" style="height:75px; text-align: center;"><br/>
                    <img src="images/psd/welcome.png" style="margin-left: -7px;"/>
                </div>
            
            <!--========//header=========== -->
            <!-- -->
            <!--==========content=========== -->
            <div id="content">

            </div>
            </div>
            <!--========//content=========== -->
            <!-- -->
            <!--==========footer=========== -->
            <div id="footer"><div><div>NTB Project of ACCP0906 &copy; 2011 | CNC-Aptech</div></div></div>
            <!--========//footer=========== -->
        
    </body>
</html>

</f:view>