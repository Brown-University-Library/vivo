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
        <script type="text/javascript" src="${urls.base}/js/infinite-rotator.js"></script>
        <!-- scripts for Google Ajax Feed API -->
        <script type="text/javascript" src="//www.google.com/jsapi?key=ABQIAAAAl69hMrMPX0hsLyE93DVyTxQBzqpr8JnUHHa00_iYLABa7Jl01hTPFSyvAN6p4kjiYtcotcoxMszxSw"></script>

        <script type="text/javascript">
        google.load("feeds", "1") //Load Google Ajax Feed API (version 1)
        </script>
        <style type="text/css">
          #wrapper-content {
            min-height: 650px;
          }
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
            margin-top:-20px;
            font-size: .85em;
          }

          a.more-news {
            color:#645e50;
          }
          li.rss-item {
            color: #ffffff;
            /*list-style-image:url(./themes/researchers-brown/images/bullet-orange.png);*/
            margin-bottom: 1.0em;
            margin-left: 1.6em;
          }

          a.rss-item {
            font-size: .90em;
            line-height: 1.0em;
            color: #ffffff;
            text-decoration: none;
            border-bottom: 1px dotted ##645e50;
            font-weight: normal;
          }

          a:hover.rss-item {
            font-size: .90em;
            line-height: 1.0em;
            color: #645e50;
            text-decoration: none;
            font-weight: normal;
          }

          .rss-box {
            clear: both;
          }

          #rotating-item-wrapper {
          	position: relative;
          	width: 200px;
          	height: 225px;
          }
          .rotating-item {
          	display: none;
          	position: absolute;
          	top: 0;
          	left: 75px;

          }

          p.viewprofile {
          	font-size: .85em;
          	text-align:center;
          }
          </style> 
    </head>

    <body class="${bodyClasses!}" onload="${bodyOnload!}">
        <#include "identity.ftl">

        <#include "menu.ftl">

        <section id="intro" role="region">
        <h2><span class="researchers-title">Welcome to Researchers@Brown</span></h2>
           <p>Researchers@Brown brings together, in one site, publicly available information on the people, departments, and activities that collectively make up research and scholarship in all disciplines at Brown University.</p>
            <p>The Spring 2014 initial release of Researchers@Brown contains data from institutional sources and verbatim content from faculty profiles in the Directory of Research and Researchers at Brown (DRRB), a precursor system. Faculty members who do not have a profile can request one by contacting the appropriate <a href="https://vivo.brown.edu/faq/">faculty affairs office</a>.
            </p>
            <p>A new <a href="/publications">"Publications"</a> section is now available.  Features include:
            <ul style="list-style:disc;margin-left:50px;">
                <li>Publications harvested from PubMed every Sunday night</li>
                <li>Enter DOI or PMID to have full citation automatically retrieved</li>
                <li>Become part of weekly harvest by entering a few PMIDs</li>
                <li>Links to full text when available</li>
                <li>Future harvesting from other sources (Web of Science, etc.)</li>
            </ul>
            </p>
            <p>A new "Geographic Research Area" section, using a standard set of geographic terms is now available.
            </p>
           <p>
            Please provide feedback or request help by contacting <a href="mailto:researchers@brown.edu">researchers@brown.edu</a>.
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
                     var feedlimit=3
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
                     rssoutput+="<li class='rss-item'>&#187;<a class='rss-item' href='" + thefeeds[i].link + "'>" + thefeeds[i].title + "</a></li>"
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
                   <hr style="width:90%;clear:right;" />
                              <p class="news-item-title">Recent Faculty Books </p>
                                <div id="rotating-item-wrapper">
                                    <a href="./display/kmclaugh">
                                    <img src="./themes/researchers-brown/images/books/kmclaugh.jpg" alt="Poetic Force: Poetry after Kant by Kevin McLaughlin" title="Poetic Force: Poetry after Kant" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/nbarnett">
                                    <img src="./themes/researchers-brown/images/books/barnett.jpg" alt="College Student Alcohol Abuse by Nancy Barnett by Nancy Barnett" title="College Student Alcohol Abuse" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/sgolub">
                                    <img src="./themes/researchers-brown/images/books/sgolub.jpg" alt="Incapacity: Wittgenstein, Anxiety, and Performance Behavior by Spencer Golub" title="Incapacity: Wittgenstein, Anxiety, and Performance Behavior" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/jpallen">
                                    <img src="./themes/researchers-brown/images/books/jpallen.jpg" alt="The Ancient Egyptian Language: a Historical Study by James P. Allen" title="The Ancient Egyptian Language: a Historical Study" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/pgould">
                                    <img src="./themes/researchers-brown/images/books/gould.jpg" alt="Writing the Rebellion: Loyalists and the Literature of Politics in British America by Philip Gould" title="Writing the Rebellion: Loyalists and the Literature of Politics in British America" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/rrambuss">
                                    <img src="./themes/researchers-brown/images/books/rambuss.jpg" alt="The English Poems of Richard Crashaw edited by Richard Rambuss" title="The English Poems of Richard Crashaw" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/mblasing">
                                    <img src="./themes/researchers-brown/images/books/blasing.jpg" alt="Nâzim Hikmet: The Life and Times of Turkey's World Poet by Mutlu Blasing" title="Nâzim Hikmet: The Life and Times of Turkey's World Poet" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/sburrows">
                                    <img src="./themes/researchers-brown/images/books/burrows.jpg" alt="A Familiar Strangeness: American Fiction and the Language of Photography, 1839-1945 by Stuart Burrows" title="A Familiar Strangeness: American Fiction and the Language of Photography, 1839-1945" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/jegan">
                                    <img src="./themes/researchers-brown/images/books/egan.jpg" alt="Oriental Shadows: The Presence of the East in Early American Literature by Jim Egan" title="Oriental Shadows: The Presence of the East in Early American Literature" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/pbarmstr">
                                    <img src="./themes/researchers-brown/images/books/armstrong.jpg" alt="The Neuroscience of Reading and Art by Paul B. Armstrong" title="The Neuroscience of Reading and Art" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/jkuzner">
                                    <img src="./themes/researchers-brown/images/books/kuzner.jpg" alt="Open Subjects: Renaissance Republicans, Modern Selfhoods and the Virtue of Vulnerability by James Kuzner" title="Open Subjects: Renaissance Republicans, Modern Selfhoods and the Virtue of Vulnerability" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/sstewart">
                                    <img src="./themes/researchers-brown/images/books/stuart-steinberg.jpg" alt="Impious Fidelity: Anna Freud, Psychoanalysis, Politics by Suzanne Stuart-Steinberg" title="Impious Fidelity: Anna Freud, Psychoanalysis, Politics" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/khaynes">
                                    <img src="./themes/researchers-brown/images/books/haynes.jpg" alt="Broken Hierarchies: Collected Poems 1952-2012 edited by Kenneth Haynes" title="Broken Hierarchies: Collected Poems 1952-2012" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/gwood">
                                    <img src="./themes/researchers-brown/images/books/wood.jpg" alt="Empire of Liberty: A History of the Early Republic, 1789-1815 by Gordon S. Wood" title="Empire of Liberty: A History of the Early Republic, 1789-1815" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/mcammett">
                                    <img src="./themes/researchers-brown/images/books/cammett.jpg" alt="Compassionate Communalism: Welfare and Sectarianism in Lebanon by Melani C. Cammett" title="Compassionate Communalism: Welfare and Sectarianism in Lebanon" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/mc133">
                                    <img src="./themes/researchers-brown/images/books/clayton.jpg" alt="Poetry in Pieces: César Vallejo and Lyric Modernity by Michelle Clayton" title="Poetry in Pieces: César Vallejo and Lyric Modernity" class="rotating-item" height="225"/>
                                    </a>
                                    
                                    <a href="./display/smerrim">
                                    <img src="./themes/researchers-brown/images/books/merrim.jpg" alt="The Spectacular City, Mexico, and Colonial Hispanic Literary Culture by Stephanie Merrim" title="The Spectacular City, Mexico, and Colonial Hispanic Literary Culture" class="rotating-item" height="225"/>
                                    </a>
                                </div>
                                <p></p>
                                 <p class="viewprofile">Click book jacket to view faculty profile</p>
                                 </div>

         </section>
    <#include "footer.ftl">
    </body>
</html>
