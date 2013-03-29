<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#educationalTraining.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->

<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<#-- Coming from propDelete, individual is not defined, but we are editing. -->
<@showEducationalTraining statement=statement editable=(!individual?? || individual.editable) />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showEducationalTraining statement editable>

    <#local degree>
        <#if statement.degreeName??>
            <#-- RY Giving up on join here. Freemarker insists on removing the space before "in"
                 and leaving no space between the degree and major field, even though compress
                 should only delete consecutive spaces. Even &nbsp; doesn't help.
            <@s.join [ statement.degreeAbbr!statement.degreeName, statement.majorField! ], " in " /> -->
            ${statement.degreeAbbr!statement.degreeName}
            <#if statement.majorField??> in ${statement.majorField}</#if>
        <#elseif statement.typeName??>
            ${statement.typeName!}
        </#if>
    </#local>
    
    <#local linkedIndividual>
        <#if statement.org??>
            <a href="${profileUrl(statement.uri("org"))}" title="organization name">${statement.orgName}</a>
        <#elseif editable>
            <#-- Show the link to the context node only if the user is editing the page. -->
            <a href="${profileUrl(statement.uri("edTraining"))}" title="missing organization">missing organization</a>
        </#if>
    </#local>

    <#local linkedThesis>
        <#if statement.thesis??>
            <ul>
            <li>${statement.thesisTypeLabel}: <a href="${profileUrl(statement.uri("thesis"))}" title="thesis">${statement.thesisTitle}</a></li>
            </ul>
        </#if>
    </#local>

    <@s.join [ degree, linkedIndividual!, statement.deptOrSchool! ] /> <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" false/> 
    ${linkedThesis!}

</#macro>
