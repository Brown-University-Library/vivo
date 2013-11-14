<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#organizationForPosition. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-sequence.ftl" as s>

<@showTraining statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showTraining statement>
    
    <#local linkedIndividual>
        <#if statement.person??>
            <a href="${profileUrl(statement.uri("person"))}" title="person name">${statement.personName}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="#" title="missing person">missing person in this position</a>
        </#if>
    </#local>
    <@s.join [ linkedIndividual, statement.trainingLabel! ] /> 

</#macro>
