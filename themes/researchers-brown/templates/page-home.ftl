<#--
Copyright (c) 2012, Cornell University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    * Neither the name of Cornell University nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-->

<@widget name="login" include="assets" />
<#include "browse-classgroups.ftl">

<!DOCTYPE html>
<html lang="en">
    <head>
        <#include "head.ftl">
        <!-- scripts for Google Ajax Feed API -->
        <script type="text/javascript" src="//www.google.com/jsapi?key=ABQIAAAAl69hMrMPX0hsLyE93DVyTxQBzqpr8JnUHHa00_iYLABa7Jl01hTPFSyvAN6p4kjiYtcotcoxMszxSw"></script>

        <script type="text/javascript">
        google.load("feeds", "1") //Load Google Ajax Feed API (version 1)
        </script>
        <style type="text/css">

          .researchers-title {
            color:#c00404;
            font-size: 1.35em;
          }

          .news-item-box {
            background:#aba698;
          }

          .news-item-title {
            margin-left:10px;
            font-family:Georgia,Times,serif;
            font-size:1em;
            font-weight:bold;
            color:white;
            text-transform:uppercase;
          }

          p.more-news {
            float:right;
          }

          a.more-news {
            color:#645e50;
          }
          li.rss-item {
            color: #ffffff;
            list-style-image:url(./themes/researchers-brown/images/bullet-orange.png);
            #list-style-type: none;
            margin-bottom: 1.0em;
            margin-left: 1.6em;
          }

          a.rss-item {
            font-size: 1em;
            line-height: 1.8em;
            color: #ffffff;
            text-decoration: none;
            border-bottom: 1px dotted ##645e50;
            font-weight: normal;
          }

          a:hover.rss-item {
            #font-size: 1.1em;
            line-height: 1.8em;
            color: #645e50;
            text-decoration: none;
            #border-bottom: 1px dotted #c81700;
            font-weight: normal;
          }

          .rss-box {
            clear: both;
          }
          </style> 
    </head>

    <body class="${bodyClasses!}" onload="${bodyOnload!}">
        <#include "identity.ftl">

        <#include "menu.ftl">

        <section id="intro" role="region">
            <h2><span class="researchers-title">Welcome to Researchers@Brown</span></h2>
            
          <!-- <p><img src="./themes/researchers-brown/images/news_items.jpg"></p> -->
          <table class="news-item">
            <tr>
             <td><img src="./themes/researchers-brown/images/spacer.gif" width="25" height="1" border="0" alt="" /></td>
             <td><img src="./themes/researchers-brown/images/spacer.gif" width="140" height="1" border="0" alt="" /></td>
             <td><img src="./themes/researchers-brown/images/spacer.gif" width="18" height="1" border="0" alt="" /></td>
             <td><img src="./themes/researchers-brown/images/spacer.gif" width="140" height="1" border="0" alt="" /></td>
             <td><img src="./themes/researchers-brown/images/spacer.gif" width="19" height="1" border="0" alt="" /></td>
             <td><img src="./themes/researchers-brown/images/spacer.gif" width="141" height="1" border="0" alt="" /></td>
             <td><img src="./themes/researchers-brown/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
            </tr>

            <tr>
            <td><img src="./themes/researchers-brown/images/spacer.gif" width="1" height="169" border="0" alt="" /></td>
             <td><a href="http://news.brown.edu/pressreleases/2013/11/schoolcrime" target="_blank">
             <img name="news_item_left" src="./themes/researchers-brown/images/news_item_left.jpg" width="140" height="169" border="0" id="news_item_left" alt="School violence lowers test scores, not grades" title="School violence lowers test scores, not grades" /></a></td>
                <td><img src="./themes/researchers-brown/images/spacer.gif" width="1" height="169" border="0" alt="" /></td>
             <td><a href="http://www.americahttp://www.americanscientist.org/issues/pub/2013/5/blood-in-motionnscientist.org/issues/pub/2013/5/blood-in-motion">
             <img name="news_item_middle" src="./themes/researchers-brown/images/news_item_middle.jpg" width="140" height="169" border="0" id="news_item_middle" alt="Blood in Motion" title="Blood in Motion"/></a></td>
                <td><img src="./themes/researchers-brown/images/spacer.gif" width="1" height="169" border="0" alt="" /></td>
             <td><a href="http://www.brown.edu/research/pembroke-center/research/seed-grants-collaborative-interdisciplinary-research" target="_blank">
             <img name="news_item_right" src="./themes/researchers-brown/images/news_item_right.jpg" width="141" height="169" border="0" id="news_item_right" alt="Pembroke Seed Grants for Collaborative Interdisciplinary Research" title="Pembroke Seed Grants for Collaborative Interdisciplinary Research" /></a></td>
             <td><img src="./themes/researchers-brown/images/spacer.gif" width="1" height="169" border="0" alt="" /></td>
            </tr>
          </table>

                <p>
                Researchers@Brown brings together in one site publicly available information on the people, departments, and
                activities that collectively make up research and scholarship in all disciplines at Brown. 

                <p>
              Faculty members not included in the initial launch can request a profile by contacting their Dean's office.
                </p>
                     <p>
                Please report issues or request help by contacting <a href="mailto:vivoteam@brown.edu">Margaret_Houska@brown.edu</a>.
                Visit our <a href="./about">Help</a> pages for further information.</p>

        </section>

        <section id="login" class="news-item-box">
            <p></p>
                <p class="news-item-title">Brown Research in the News</p>
                <hr />
              <!-- GOOGLE AJAX FEED API -->
             
             <div id="feeddiv" class="rss-box"></div>
            <script type="text/javascript">

            var feedcontainer=document.getElementById("feeddiv")
            var feedurl="http://www.brown.edu/research/news/rss"
            var feedlimit=5
            var rssoutput="<ul>"

            function rssfeedsetup(){
            var feedpointer=new google.feeds.Feed(feedurl) //Google Feed API method
            feedpointer.setNumEntries(feedlimit) //Google Feed API method
            feedpointer.load(displayfeed) //Google Feed API method
            }

            function displayfeed(result){
            if (!result.error){
            var thefeeds=result.feed.entries
            for (var i=0; i<thefeeds.length; i++)
            rssoutput+="<li class='rss-item'><a class='rss-item' href='" + thefeeds[i].link + "'>" + thefeeds[i].title + "</a></li>"
            rssoutput+="<p class='more-news'>&#187; <a href='http://www.brown.edu/research/news' class='more-news'>View More</a>&nbsp;&nbsp;&nbsp;</p></ul>"
            feedcontainer.innerHTML=rssoutput
            }
            else
            alert("Error fetching feeds!")
            }

            window.onload=function(){
            rssfeedsetup()
            }

          </script>      
        
         </section>

    <#include "footer.ftl">
    </body>
</html>
