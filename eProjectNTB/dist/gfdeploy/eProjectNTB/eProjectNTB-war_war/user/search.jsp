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
    <div class="box-1">
        <img src="images/header_title_1.gif" class="title" alt="" />
        <form id="search-form" action="" enctype="multipart/form-data">
            <div class="container">
                <div class="box-1">
                    <div><input type="radio" name="1" class="radio" checked="checked" /> Industrial</div>
                    <div><input type="radio" name="1" class="radio" /> Office</div>
                    <div><input type="radio" name="1" class="radio" /> Shopping Center</div>
                    <div><input type="radio" name="1" class="radio" /> Land</div>
                    <a href="#" class="top-indent-4"> List selling...</a>
                </div>
                <div class="box-2">
                    <div class="row"><div id="txtsearch">City</div><div id="txtsearch1"><select><option>&nbsp; Ho Chi Minh</option></select></div></div>
                    <div class="row"><div id="txtsearch">District</div><div id="txtsearch1"><select><option>&nbsp; Go Vap</option></select></div></div>
                    <div class="row"><div id="txtsearch">Street</div><div id="txtsearch1"> <select><option>&nbsp; Pham Van Chieu</option></select></div></div>
                    <!--<div class="row"><input type="text" value="Zip Code" onfocus="this.value=''" /></div>-->
                    <div id="txtsearch" style="width:120px;">&nbsp;</div><div id="txtsearch1"><a href="#" onclick="getElementById('search-form').submit()"><img src="images/buttonsearch.png" alt="" /></a></div>
                </div>
            </div>
        </form>
    </div>
    <div class="box-2">

    </div>
</f:subview>