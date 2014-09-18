<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#hasRole and its child properties.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<@showCredential statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showCredential statement>

    <#local date>
        <#if (statement.start?? && !(statement.end??))>
            ${statement.start}
        <#elseif (statement.start?? && statement.end??)>
            ${statement.start}-${statement.end}
        </#if>
    </#local>

    <#local orgHosp>
        <#if (statement.org?? && statement.hosp??)>
            <a href="${profileUrl(statement.uri("org"))}" title="granted by">${statement.orgText!}</a>,&nbsp;<a href="${profileUrl(statement.uri("hosp"))}" title="credential hospialty">${statement.hospText!}</a>
        <#elseif (statement.org?? && !(statement.hosp??))>
            <a href="${profileUrl(statement.uri("org"))}" title="granted by">${statement.orgText!}</a>
        </#if>
    </#local>

    <#local specialty>
        <#if statement.spec??>
            ,&nbsp;<a href="${profileUrl(statement.uri("spec"))}" title="granted by">${statement.specText!}</a>
        </#if>
    </#local>

    <#local city>
        <#if statement.pdocCity??>
            &#35;${statement.pdocCity!}
        </#if>
    </#local>

    <#local state>
        <#if statement.pdocState??>
            &#35;${statement.pdocState!}
        </#if>
    </#local>

    <#local country>
        <#if statement.pdocCountry??>
            &#35;${statement.pdocCountry!}
        </#if>
    </#local>

    <#local label>
        <#if statement.pdocText??>
            ${statement.pdocText!}.
        </#if>
    </#local>

${label}${orgHosp}${specialty}${date}${city}${state}${country}
</#macro>