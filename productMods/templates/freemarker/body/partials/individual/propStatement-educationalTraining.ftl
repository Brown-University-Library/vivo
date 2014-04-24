<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#educationalTraining.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->

<@showDegree statement />

<#macro showDegree statement>
<#local linkedIndividual>
        <#if statement.org??>
            <a href="${profileUrl(statement.uri("org"))}" title="organization name">${statement.orgName!}</a>
        </#if>
</#local>
${statement.degree!}. ${linkedIndividual!} ${statement.date!}
</#macro>

