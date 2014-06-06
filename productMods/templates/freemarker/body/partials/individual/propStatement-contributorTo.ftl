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
    <#local citationDetails>
        <#if statement.subclass??>
            <#if statement.subclass?contains("Article")>
                <#if statement.journal??>
                    <em>${statement.journal!}</em>.&nbsp;
<#if statement.volume?? && statement.issue?? && statement.startPage?? && statement.endPage??>
                         ${statement.volume!}.${statement.issue!}, ${statement.startPage!}-${statement.endPage!}.
                    <#elseif statement.volume?? && statement.startPage?? && statement.endPage??>
                        ${statement.volume!}:${statement.startPage!}-${statement.endPage!}.
<#elseif statement.volume?? && statement.issue?? && statement.startPage??>
${statement.volume!}.${statement.issue!}, ${statement.startPage!}.
                    <#elseif statement.volume?? && statement.startPage??>
                        ${statement.volume!}:${statement.startPage!}.
<#elseif statement.volume?? && statement.issue??>
${statement.volume!}.${statement.issue!}.
                    <#elseif statement.volume??>
                        ${statement.volume!}.
                    <#elseif statement.startPage?? && statement.endPage??>
                        ${statement.startPage!}-${statement.endPage!}.
                    <#elseif statement.startPage??>
                        ${statement.startPage!}.
                    </#if>
                </#if>
            <#elseif statement.subclass?contains("Chapter")>

            <#elseif statement.subclass?contains("Book")>
            <#else>
            </#if>
        </#if>
    </#local>

    <#local resourceTitle>
        <#if statement.citation>
            <a href="${profileUrl(statement.uri("citation"))}" title="resource name">${statement.label}</a>
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
    

    ${authorList}${resourceTitle} ${citationDetails} <@dt.yearSpan "${statement.dateTime!}" /> ${doi}
</#if>
</#macro>