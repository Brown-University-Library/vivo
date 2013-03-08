<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for sparkline visualization on individual profile page -->

<#-- Determine whether this person is an author -->
<#assign isAuthor = p.hasStatements(propertyGroups, "${core}authorInAuthorship") />

<#if (isAuthor)>
 
    ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/visualization/visualization.css" />')}
    <#assign standardVisualizationURLRoot ="/visualization">
    
    <section id="visualization" role="region">
        <#if isAuthor>
            <#assign coAuthorIcon = "${urls.images}/visualization/coauthorship/co_author_icon.png">
            <#assign coAuthorVisUrl = individual.coAuthorVisUrl()>
            
            <#assign googleJSAPI = "https://www.google.com/jsapi?autoload=%7B%22modules%22%3A%5B%7B%22name%22%3A%22visualization%22%2C%22version%22%3A%221%22%2C%22packages%22%3A%5B%22imagesparkline%22%5D%7D%5D%7D"> 
            
            <span id="sparklineHeading">Publications in VIVO</span>   
            
            <div id="vis_container_coauthor">&nbsp;</div>
            
            <div class="collaboratorship-link-separator"></div>
            
            <div id="coauthorship_link_container" class="collaboratorship-link-container">
				<div class="collaboratorship-icon">
                    <a href="${coAuthorVisUrl}" title="co-author"><img src="${coAuthorIcon}" alt="Co-author network icon" width="30px" height="30px" /></a>
                </div>
                <div class="collaboratorship-link"><a href="${coAuthorVisUrl}" title="co-author network">Co-Author Network</a></div>
            </div>
            
            <div class="collaboratorship-link-separator"></div>
            
            ${scripts.add('<script type="text/javascript" src="${googleJSAPI}"></script>',
                          '<script type="text/javascript" src="${urls.base}/js/visualization/visualization-helper-functions.js"></script>',
                          '<script type="text/javascript" src="${urls.base}/js/visualization/sparkline.js"></script>')}           
            
            <script type="text/javascript">
                var visualizationUrl = '${urls.base}/visualizationAjax?uri=${individual.uri?url}';
                var infoIconSrc = '${urls.images}/iconInfo.png';
            </script>
            
        </#if>
        
    </section>
</#if>