#!/usr/bin/perl
#
# Program:	ehmy1st_clntsd_imagemap.pl
# Creator:	Eric Hepperle
# Date:		09/19/01
#
# Purpose:	Not my script.  Client side image map example.  Should write a new webpage to a file, then launch, or just do cgi.
#
###################################################### 



 <MAP NAME="MyMap">

    <AREA SHAPE="rect" COORDS="1,114, 224,150"

       HREF="communications.html">

       <AREA SHAPE="polygon"

       COORDS="10,15,99,4,105,24,77,57,23,54" HREF="web.html">

       <AREA SHAPE="circle" COORDS="162,55,50" HREF="earth.html">

       <AREA SHAPE=default HREF="none.html">

 </MAP>


 <IMG SRC="/graphics/webcomi.gif" USEMAP="#MyMap">

