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

<f:subview id="header">
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
                <object data="flash/home.swf?button=6"
                        width="980" height="492" type="application/x-shockwave-flash">
                    <param name="quality" value="high" />
                    <param name="menu" value="false" />
                    <param name='wmode' value='transparent' />
                    <param name='name' value='wmode' />
                    <param name="pluginurl" value="http://www.macromedia.com/go/getflashplayer" />
                    FAIL (the browser should render some flash content, not this).
                </object>
                <!--> <![endif]-->
            </object>
        </div>
        <div class="header_form" style="background:url(images/noidunggiua.jpg);">            

            <div class="noidung">
            </f:subview>