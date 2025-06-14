#######################################################################
#
# Win32::Internet - Perl Module for Internet Extensions
# ^^^^^^^^^^^^^^^
# This module creates an object oriented interface to the Win32
# Internet Functions (WININET.DLL).
#
# Version: 0.08 (14 Feb 1997)
# by Aldo Calpini <dada@divinf.it>
#
#######################################################################


Manifest:
^^^^^^^^^
The file Win32Internet-0.08.zip contains:

    README
    README.TXT
    TEST.PL
    TEST-ASYNC.PL
    INTERNET.PM
    INTERNET.PLL.110
    INTERNET.PLL.30x
    DOCS\APPEND.HTML
    DOCS\INDEX.HTML
    DOCS\INTRO.HTML
    DOCS\LICENSE.HTML
    DOCS\REFERENCE.HTML
    DOCS\TOC.HTML
    SOURCE\INTERNET.CPP
    SOURCE\INTERNET.DEF
    SOURCE\INTERNET.MAK
    SOURCE\INTERNET300.MAK
    SOURCE\README.TXT

(be sure to have unzipped it with LONG FILE NAMES and PATHS)


What's New
^^^^^^^^^^
Changes from version 0.07 are:

    . fixed 2 more bugs in Option(s) related subs (thanks to Brian
      Helterline!). 

    . Error() now gets error messages directly from WININET.DLL.

    . The PLL file now comes in 2 versions, one for Perl version
      5.001 (build 100) and one for Perl version 5.003 (build 300
      and higher). Everybody should be happy now :) 

    . added an installation program. 


Installation Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^
    1. Make sure you have somewhere in your Windows directory the file
       WININET.DLL (it comes with Microsoft Internet Explorer 3.0). 
    2. Run the INSTALL.BAT program.
    3. Run the TEST.PL script to see if everything works.
    3. Have fun.


Functions Overview
^^^^^^^^^^^^^^^^^^
General Functions:
    CanonicalizeURL, Close, CombineURL, ConnectBackoff, ConnectRetries,
    ConnectTimeout, ControlReceiveTimeout, ControlSendTimeout, CrackURL,
    CreateURL, DataReceiveTimeout, DataSendTimeout, Error, FetchURL,
    FTP, GetResponse, GetStatusCallback, HTTP, new, OpenURL, Password,
    QueryDataAvailable, QueryOption, ReadEntireFile, ReadFile, SetOption,
    SetStatusCallback, TimeConvert, UserAgent, Username, Version

FTP Functions:
    Ascii, Binary, Cd, Delete, Get, List, Mode, Mkdir, Put, Pwd, Rename, 
    Rmdir

HTTP Functions:
    AddHeader, OpenRequest, QueryInfo, Request, SendRequest


Documentation
^^^^^^^^^^^^^
Complete documentation for this package is in the file DOCS\INDEX.HTML.


On-line
^^^^^^^
You can always find the latest version of this package online at:

    http://www.divinf.it/dada/perl/internet

Send any comment to:

    Aldo Calpini  mailto:dada@divinf.it

