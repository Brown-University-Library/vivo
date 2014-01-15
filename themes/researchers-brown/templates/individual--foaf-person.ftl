<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for foaf:Person individuals -->
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#if !labelCount??>
    <#assign labelCount = 0 >
</#if>
<section id="individual-intro" class="vcard person" role="region">

    <section id="share-contact" role="region">
        <#-- Image -->
        <#assign individualImage>
            <@p.image individual=individual
                      propertyGroups=propertyGroups
                      namespaces=namespaces
                      editable=editable
                      showPlaceholder="always" />
        </#assign>

        <#if ( individualImage?contains('<img class="individual-photo"') )>
            <#assign infoClass = 'class="withThumb"'/>
        </#if>

        <div id="photo-wrapper">${individualImage}</div>

        <#include "individual-contactInfo.ftl">

        <#-- Links -->
        <@vp.webpages propertyGroups editable "individual-urls-people" />

        <#assign blocal = "http://vivo.brown.edu/ontology/vivo-brown/">
        <#assign cvLink = propertyGroups.pullProperty("${blocal}cv")!>
        <#if cvLink?has_content>
            <ul id="cvLink">
                <@p.objectPropertyList cvLink editable />
            </ul>
        </#if>

    </section>

    <section id="individual-info" ${infoClass!} role="region">
        <#include "individual-visualizationFoafPerson.ftl">
        <#-- Disable for now until controller sends data -->
        <#--
        <section id="co-authors" role="region">
            <header>
                <h3><span class="grey">10 </span>Co-Authors</h3>
            </header>

            <ul role="list">
                <li role="listitem"><a href="#" title="co-author image"><img class="co-author" src="" /></a></li>
                <li role="listitem"><a href="#" title="co-author image"><img class="co-author" src="" /></a></li>
            </ul>

            <p class="view-all-coauthors"><a class="view-all-style" href="#" title="view all">View All <img src="${urls.images}/arrowIcon.gif" alt="arrow icon" /></a></p>
        </section>
        -->

        <#include "individual-adminPanel.ftl">

        <header>
            <#if relatedSubject??>
                <h2>${relatedSubject.relatingPredicateDomainPublic} for ${relatedSubject.name}</h2>
                <p><a href="${relatedSubject.url}" title="return to">&larr; return to ${relatedSubject.name}</a></p>
            <#else>
                <h1 class="vcard foaf-person">
		    <#-- Name display first middle last -->
		    <#assign foaf = "http://xmlns.com/foaf/0.1/" />
		    <#assign firstName = propertyGroups.pullProperty("${foaf}firstName")!>
		    <#assign middleName = propertyGroups.pullProperty("${core}middleName")!>
		    <#assign lastName = propertyGroups.pullProperty("${foaf}lastName")!>
		    <#if firstName.statements?has_content && lastName.statements?has_content>
			<span class="fn">${firstName.statements[0].value!}<#if middleName.statements?has_content> ${middleName.statements[0].value!}<#if middleName.statements[0].value?length < 3>.</#if> </#if> ${lastName.statements[0].value!}</span>
		    <#else>
			<span class="fn"><@p.label individual editable labelCount/></span>
		    </#if>

                    <#--  Display preferredTitle if it exists; otherwise mostSpecificTypes -->
                    <#assign title = propertyGroups.pullProperty("${core}preferredTitle")!>
                    <#if title?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
                        <@p.addLinkWithLabel title editable />
                        <#list title.statements as statement>
                            <span class="display-title">${statement.value}</span>
                            <@p.editingLinks "${title.name}" statement editable />
                        </#list>
                    </#if>
                    <#-- If preferredTitle is unpopulated, display mostSpecificTypes -->
                    <#if ! (title.statements)?has_content>
                        <@p.mostSpecificTypes individual />
                    </#if>
                </h1>
            </#if>
	     
            <#-- Positions -->
            <#assign positions = propertyGroups.pullProperty("${core}personInPosition")!>
            <#if positions?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
		<h2 id="brown-affiliations">Brown Affiliations</a></h2>
		<ul>
		    <#list positions.statements as pos>
			<li style="display:inline"><a href="${pos.org}">${pos.orgName}</a><#if pos_has_next>,</#if></li>
		    </#list>
		</ul>
            </#if>
        </header>

        <#-- Overview -->
        <#include "individual-overview.ftl">

        <#-- Research Areas -->
        <#assign researchAreas = propertyGroups.pullProperty("${core}hasResearchArea")!>
        <#if researchAreas?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
            <@p.objectPropertyListing researchAreas editable />
        </#if>

		<#-- VIVO OpenSocial Extension by UCSF -->
		<#if openSocial??>
			<#if openSocial.visible>
			    <div id="openSocial">
			        <h2>OpenSocial</h2>
				    <#-- It would likely make sense to remove the #if logic as it is safe and -->
				    <#-- arguably better to just have both divs in all conditions -->
				    <#if editable>
	            	    <div id="gadgets-edit" class="gadgets-gadget-parent"></div>
	                <#else>
	            	    <div id="gadgets-view" class="gadgets-gadget-parent" ></div>
	                </#if>
	            </div>
            </#if>
		</#if>
    </section>

</section>

<#assign nameForOtherGroup = "other"> <#-- used by both individual-propertyGroupMenu.ftl and individual-properties.ftl -->

<#-- Property group menu -->
<#include "individual-propertyGroupMenu.ftl">

<#-- Ontology properties -->
<#if !editable>
	<#-- We don't want to see the first name and last name unless we might edit them. -->
	<#assign skipThis = propertyGroups.pullProperty("http://xmlns.com/foaf/0.1/firstName")!>
	<#assign skipThis = propertyGroups.pullProperty("http://xmlns.com/foaf/0.1/lastName")!>
</#if>

<#include "individual-properties.ftl">

<#assign rdfUrl = individual.rdfUrl>

<#if rdfUrl??>
    <script>
        var individualRdfUrl = '${rdfUrl}';
    </script>
</#if>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual.css" />',
                  '<link rel="stylesheet" href="${urls.base}/css/individual/individual-vivo.css" />',
                  '<link rel="stylesheet" href="${urls.base}/js/jquery-ui/css/smoothness/jquery-ui-1.8.9.custom.css" />')}

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/tiny_mce/tiny_mce.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/qtip/jquery.qtip-1.0.0-rc3.min.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/jquery.truncator.js"></script>')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/individual/individualUtils.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/individual/individualUriRdf.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/jquery-ui/js/jquery-ui-1.8.9.custom.min.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/imageUpload/imageUploadUtils.js"></script>')}

