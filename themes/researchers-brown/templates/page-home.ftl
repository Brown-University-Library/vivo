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
        <p>Researchers@Brown brings together, in one site, publicly available information on the people, departments, and activities that collectively make up research and scholarship in all disciplines at Brown.</p>
            <p>The Spring 2014 initial release of Researchers@Brown contains data from institutional sources and verbatim content from faculty profiles in the Directory of Research and Researchers at Brown (DRRB), the precursor system. Faculty members who do not have a profile can request one by contacting the appropriate <a href="https://vivo.brown.edu/faq/">faculty affairs office</a>.
            </p>
            <p>A new <a href="/publications">“Publications”</a> section is now available.  Features include:
            <ul style="list-style:disc;margin-left:50px;">
                <li>Enter DOI or PMID to have full citation automatically retrieved</li>
                <li>Links to full text when available</li>
                <li>Easy form for entering publications as separate fields</li>
                <li>Harvested publications from PubMed for BioMed and Public Health faculty</li>
                <li>Future arvesting from other sources (Web of Science, etc.) and for other faculty groups and disciplines</li>
            </ul>
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
                                <a href="./display/lbraun">
                                <img src="./themes/researchers-brown/images/books/braun.jpg" 
                                alt="Breathing Race into the Machine by Lundy Braun" 
                                title="Breathing Race into the Machine: The Surprising Career of the Spirometer from Plantation to Genetics" 
                                class="rotating-item" height="225"/>

                                <a href="./display/tbewes">
                                <img src="./themes/researchers-brown/images/books/bewes.jpg" 
                                alt="The Event of Postcolonial Shame by Timothy Bewes" 
                                title="The Event of Postcolonial Shame" 
                                class="rotating-item" height="225"/>

                                <a href="./display/rcoover">
                                <img src="./themes/researchers-brown/images/books/coover.jpg" 
                                alt="The Brunist Day of Wrath by Robert Coover" 
                                title="The Brunist Day of Wrath" 
                                class="rotating-item" height="225"/>
                                <a href="./display/shouston">
                                     <img src="./themes/researchers-brown/images/books/houston.jpg" alt="The Life Within: Classic Maya and the Matter of Permanence by Stephen Houston" title="The Life Within: Classic Maya and the Matter of Permanence" class="rotating-item" height="200" />
                                     </a>
                                         <a href="./display/kyperry">
                                     <img src="./themes/researchers-brown/images/books/perry.jpg" alt="Black Women against the Land Grab by Keisha-Khan Perry" title="Black Women against the Land Grab: The Fight for Racial Justice in Brazil " class="rotating-item" height="225" />
                                   </a>
                                         <a href="./display/elincoln">
                                     <img src="./themes/researchers-brown/images/books/lincoln.jpg" alt="Brilliant Discourse: Pictures and Readers in Early Modern Rome by Evelyn Lincoln" title="Brilliant Discourse: Pictures and Readers in Early Modern Rome" class="rotating-item" height="225" />
                                     </a>
                                       <a href="./display/fhamlin">
                                     <img src="./themes/researchers-brown/images/books/hamlin.jpg" alt="Crossroads at Clarksdale: The Black Freedom Struggle in the Mississippi Delta after World War II by Francoise Hamlin" title="Crossroads at Clarksdale: The Black Freedom Struggle in the Mississippi Delta after World War II" class="rotating-item" height="225" />
                                     </a>
                                             <a href="./display/mblyth">
                                     <img src="./themes/researchers-brown/images/books/blyth.jpg" alt="Austerity by Mark Blyth" title="Austerity" class="rotating-item" height="225" />
                                     </a>
                                   <a href="./display/bevenson">
                                     <img src="./themes/researchers-brown/images/books/evenson.jpg" alt="Immobility by Brian Evenson" title="Immobility" class="rotating-item" height="225" />
                                       </a>
                                             <a href="./display/rcheit">
                                     <img src="./themes/researchers-brown/images/books/cheit.jpg" alt="The Witch-Hunt Narrative: Politics, Psychology, and the Sexual Abuse of Children by Ross Cheit" title="The Witch-Hunt Narrative: Politics, Psychology, and the Sexual Abuse of Children" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/njacobs">
                                     <img src="./themes/researchers-brown/images/books/jacobs.jpg" alt="African History through Sources by Nancy Jacobs" title="African History through Sources: Volume 1, Colonial Contexts and Everyday Experiences, c.1850-1946" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/rself">
                                     <img src="./themes/researchers-brown/images/books/self.jpg" alt="All in the Family: The Realignment of American Democracy Since the 1960s by Robert Self" title="All in the Family: The Realignment of American Democracy Since the 1960s" class="rotating-item" height="225" />
                                     </a>
                                         <a href="./display/cmaso">
                                     <img src="./themes/researchers-brown/images/books/maso.jpg" alt="Mother and Child by Carole Maso" title="Mother and Child: A Novel" class="rotating-item" height="225" />
                                     </a>
                                       <a href="./display/dkertzer">
                                     <img src="./themes/researchers-brown/images/books/kertzer.jpg" alt="The Pope and Mussolini by David Kertzer" title="The Pope and Mussolini: The Secret History of Pius XI and the Rise of Fascism in Europe" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/mggill">
                                     <img src="./themes/researchers-brown/images/books/gill.jpg" alt="Philosophos: Plato's Missing Dialogue by Mary Louise Gill" title="Philosophos: Plato's Missing Dialogue" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/jleinawe">
                                     <img src="./themes/researchers-brown/images/books/leinaweaver.jpg" alt="Adoptive Migration: Raising Latinos in Spain by Jessaca Leinaweaver" title="Adoptive Migration: Raising Latinos in Spain" class="rotating-item" height="225" />
                                     </a>
                                       <a href="./display/cmontros">
                                     <img src="./themes/researchers-brown/images/books/montross.jpg" alt="Falling Into the Fire: A Psychiatrist's Encounters with the Mind in Crisis by Christine Montross" title="Falling Into the Fire: A Psychiatrist's Encounters with the Mind in Crisis" class="rotating-item" height="225" />
                                     </a>
                                         <a href="./display/jtomasip">
                                     <img src="./themes/researchers-brown/images/books/tomasi.jpg" alt="Free Market Fairness by John Tomasi" title="Free Market Fairness" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/rherz">
                                     <img src="./themes/researchers-brown/images/books/herz.jpg" alt="That's Disgusting: Unraveling the Mysteries of Repulsion by Rachel Herz" title="That's Disgusting: Unraveling the Mysteries of Repulsion" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/dhogan">
                                     <img src="./themes/researchers-brown/images/books/hogan.jpg" alt="Family Consequences of Children's Disabilities by Denis Hogan" title="Family Consequences of Children's Disabilities" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/el46">
                                     <img src="./themes/researchers-brown/images/books/lim.jpg" alt="Brown Boys and Rice Queens: Spellbinding Performance in the Asias  by Eng-Beng Lim" title="Brown Boys and Rice Queens: Spellbinding Performance in the Asias" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/shamdy">
                                     <img src="./themes/researchers-brown/images/books/hamdy.jpg" alt="Our Bodies Belong to God by Sherine Hamdy" title="Our Bodies Belong to God: Organ Transplants, Islam, and the Struggle for Human Dignity in Egypt" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/rlagos">
                                     <img src="./themes/researchers-brown/images/books/lagos_escobar.jpg" alt="The Southern Tiger: Chile's Fight for a Democratic and Prosperous Future by Ricardo Lagos Escobar" title="The Southern Tiger: Chile's Fight for a Democratic and Prosperous Future" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/dcjackso">
                                     <img src="./themes/researchers-brown/images/books/jackson.jpg" alt="Life in a Shell: A Physiologist's View of a Turtle by Donald C. Jackson" title="Life in a Shell: A Physiologist's View of a Turtle" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/aremensn">
                                     <img src="./themes/researchers-brown/images/books/remensnyder.jpg" alt="La Conquistadora by Amy Remensnyder" title="La Conquistadora: The Virgin Mary at War and Peace in the Old and New Worlds" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/lf7">
                                     <img src="./themes/researchers-brown/images/books/fisher.jpg" alt="The Indian Great Awakening: Religion and the Shaping of Native Cultures in Early America by Linford D. Fisher" title="The Indian Great Awakening: Religion and the Shaping of Native Cultures in Early America" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/jcayley">
                                     <img src="./themes/researchers-brown/images/books/cayley.jpg" alt="How It Is in Common Tongues by John Cayley" title="How It Is in Common Tongues" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/jconant">
                                     <img src="./themes/researchers-brown/images/books/conant.jpg" alt="Staying Roman by Jonathan Conant" title="Staying Roman: Conquest and Identity in Africa and the Mediterranean, 439-700" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/tgharris">
                                     <img src="./themes/researchers-brown/images/books/harris.jpg" alt="Rebellion: Britain's First Stuart Kings, 1567-1642 by Tim Harris" title="Rebellion: Britain's First Stuart Kings, 1567-1642" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/pfaudree">
                                     <img src="./themes/researchers-brown/images/books/faudree.jpg" alt="Singing for the Dead: The Politics of Indigenous Revival in Mexico by Paya Faudree" title="Singing for the Dead: The Politics of Indigenous Revival in Mexico" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/fgander">
                                     <img src="./themes/researchers-brown/images/books/gander.jpg" alt="Eiko and Koma by Forrest Gander" title="Eiko and Koma" class="rotating-item" height="225" />
                                     </a>
                                           <a href="./display/jngreen">
                                     <img src="./themes/researchers-brown/images/books/green.jpg" alt="Modern Latin America by James N. Green" title="Modern Latin America, 8th edition" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/narpaly">
                                     <img src="./themes/researchers-brown/images/books/arpaly.jpg" alt="In Praise of Desire by Nomy Arpaly" title="In Praise of Desire (Oxford Moral Theory)" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/km8">
                                     <img src="./themes/researchers-brown/images/books/miller.jpg" alt="Playing Along by Kiri Miller" title="Playing Along: Digital Games, YouTube, and Virtual Performance (Oxford Music/Media)"class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/mmandel">
                                     <img src="./themes/researchers-brown/images/books/mandel.jpg" alt="Muslims and Jews in France by Maud Mandel" title="Muslims and Jews in France: History of a Conflict" class="rotating-item" height="225" />
                                     </a>
                                             <a href="./display/msteinba">
                                     <img src="./themes/researchers-brown/images/books/steinbach.jpg" alt="The Charmed Life of Flowers by Meredith Steinbach" title="The Charmed Life of Flowers: Field Notes from Provence" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/oharmans">
                                     <img src="./themes/researchers-brown/images/books/harmansah.jpg" alt="Cities and the Shaping of Memory in the Ancient Near East by Omur Harmansah" title="Cities and the Shaping of Memory in the Ancient Near East" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/jmsteele">
                                     <img src="./themes/researchers-brown/images/books/steele.jpg" alt="Ancient Astronomical Observations and the Study of the Moon's Motion (1691-1757) by John Steele" title="Ancient Astronomical Observations and the Study of the Moon's Motion (1691-1757)" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/cswensen">
                                     <img src="./themes/researchers-brown/images/books/swensen.jpg" alt="Gravesend by Cole Swensen" title="Gravesend" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/mrutz">
                                     <img src="./themes/researchers-brown/images/books/rutz.jpg" alt="Bodies of Knowledge in Ancient Mesopotamia by Matthew Rutz" title="Bodies of Knowledge in Ancient Mesopotamia: The Diviners of Late Bronze Age Emar and their Tablet Collection (Ancient Magic and Divination)" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/jwideman">
                                     <img src="./themes/researchers-brown/images/books/wideman.jpg" alt="Conversations with John Edgar Wideman" title="Conversations with John Edgar Wideman" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/jpucci">
                                     <img src="./themes/researchers-brown/images/books/pucci.jpg" alt="Augustine's Virgilian Retreat by Joseph Pucci" title="Augustine's Virgilian Retreat: Reading the Auctores at Cassiciacum" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/as49">
                                     <img src="./themes/researchers-brown/images/books/scherer.jpg" alt="Embattled Bodies, Embattled Places: War in Pre-Columbian Mesoamerica and the Andes by Andrew Scherer" title="Embattled Bodies, Embattled Places: War in Pre-Columbian Mesoamerica and the Andes" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/pandreas">
                                     <img src="./themes/researchers-brown/images/books/andreas.jpg" alt="Smuggler Nation: How Illicit Trade Made America by Peter Andreas" title="Smuggler Nation: How Illicit Trade Made America" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/cimbrigl">
                                     <img src="./themes/researchers-brown/images/books/imbriglio.jpg" alt="Intimacy by Catherine Imbriglio" title="Intimacy" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/rmeckel">
                                     <img src="./themes/researchers-brown/images/books/meckel.jpg" alt="Classrooms and Clinics by Richard A. Meckel" title="Classrooms and Clinics: Urban Schools and the Protection and Promotion of Child Health, 1870-1930 (Critical Issues in Health and Medicine)" class="rotating-item" height="225" />
                                     </a>
                                               <a href="./display/avidler">
                                     <img src="./themes/researchers-brown/images/books/vidler.jpg" alt="The Third Typology and Other Essays by Anthony Vidler" title="The Third Typology and Other Essays" class="rotating-item" height="225" />
                                     </a>
                                   </div>
                                   <p></p>
                                 <p class='viewprofile'>Click book jacket to view faculty profile</p>
                                 </div>

         </section>
    <#include "footer.ftl">
    </body>
</html>
