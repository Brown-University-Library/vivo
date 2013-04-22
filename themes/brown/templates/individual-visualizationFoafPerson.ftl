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
            <div class="collaboratorship-link-separator"></div> 
            
            <div id="coauthorship_link_container" class="collaboratorship-link-container">
				<div class="collaboratorship-icon">
                    <a href="${coAuthorVisUrl}" title="co-author"><img src="${coAuthorIcon}" alt="Co-author network icon" width="30px" height="30px" /></a>
                </div>
                <div class="collaboratorship-link"><a href="${coAuthorVisUrl}" title="co-author network">Co-Author Network</a></div>
            </div>
	    <div class="collaboratorship-link-separator"></div>
            
        </#if>
        
    </section>
</#if>
