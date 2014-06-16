<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#contibutorTo.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->
 
<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<@showContributor statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showContributor statement>
<#if statement.hideThis?has_content>
    <span class="hideThis">&nbsp;</span>
    <script type="text/javascript" >
        $('span.hideThis').parent().parent().addClass("hideThis");
        if ( $('h3#contibutorTo').attr('class').length == 0 ) {
            $('h3#contibutorTo').addClass('hiddenPubs');
        }
        $('span.hideThis').parent().remove();
    </script>
<#else>

    <#--
    <#local resourceTitle>
        <#if statement.citation??>
            <a href="${profileUrl(statement.uri("citation"))}" title="resource name">${statement.label}</a>
        <#else>            
            <a href="${profileUrl(statement.uri("citation"))}" title="missing resource">missing information resource</a>
        </#if>
    </#local>
    -->
    <#-- This shouldn't happen, but we must provide for it -->

    <#local resourceTitle>
        <#if statement.label??>
            ${statement.label}&nbsp;
        </#if>
    </#local>

    <#local resource>
        <#if statement.citation??>
            <a class="full-text-link" href="${profileUrl(statement.uri("citation"))}" title="resource name">more info</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("citation"))}" title="missing resource">missing information resource</a>
        </#if>
    </#local>
    
    <#local doi>
        <#if statement.doi??>
            <a class="full-text-link" href="http://dx.doi.org/${statement.doi}">full text</a>
        </#if>
    </#local>

    <#local pmid>
        <#if statement.pmid??>
            <a class="full-text-link" href="http://www.ncbi.nlm.nih.gov/pubmed/?term=${statement.pmid}">PubMed</a>
        </#if>
    </#local>

    <#local authorList>
       <#if statement.authorList??>
           <#if statement.authorList?ends_with('.') == true>
${statement.authorList}&nbsp;
           <#else>
${statement.authorList}.&nbsp;
           </#if>
        <#else>
${statement.lastName}, ${statement.firstName}.&nbsp;
       </#if>
    </#local>

    <#local venue>
        <#if statement.venue??>
            <em>${statement.venueLabel}</em>.&nbsp;
        </#if>
    </#local>

    <#local linkedData>
        <#if resource??>
            <br />${resource}${doi}${pmid}
        </#if>
    </#local>

    ${resourceTitle}${venue}<@dt.yearSpan "${statement.dateTime!}" />${linkedData}
</#if>
</#macro>