<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><tiles:getAsString name="title" /></title>
    
    <!-- cssSrc -->
	<tiles:insertAttribute name="cssSrc" />
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      <!-- left SideBar -->
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="#" class="site_title"><i class="fa fa-paw"></i> <span>Career Manage!!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="../view/images/sam.jpg" alt="profile_pic" class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <h2>${ComImpo.name }</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <tiles:insertAttribute name="comSidebar" />
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <tiles:insertAttribute name="menuFooter" />
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>
	  <!-- /left SideBar -->
        <!-- top navigation -->
        <div class="top_nav">
          <tiles:insertAttribute name="comTopNav" />
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <tiles:insertAttribute name="comMainContents" />
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <tiles:insertAttribute name="contentFooter" />
        </footer>
        <!-- /footer content -->
      </div>
    </div>
	<!-- scriptSrc -->
	<tiles:insertAttribute name="scriptSrc" />
  </body>
</html>
