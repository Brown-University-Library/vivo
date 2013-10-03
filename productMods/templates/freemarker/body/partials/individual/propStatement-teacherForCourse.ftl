<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#hasRole and its child properties.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-datetime.ftl" as dt>

<@showRole statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showRole statement>
<#local linkedIndividual>
    <#if statement.canon??>
        <a href="${profileUrl(statement.uri("canon"))}" title="class">${statement.sbjCode!} ${statement.courseNumber!}: ${statement.canonLabel!}</a>
        . ${statement.termList}.
    <#else>
        <#-- This shouldn't happen, but we must provide for it -->
        <a href="${profileUrl(statement.uri("canon"))}" title="missing activity">missing activity</a>
    </#if>
</#local>

${linkedIndividual}
</#macro>
