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

    <#local accreditor>
        <#if (statement.acc?? && statement.spec??)>
            <a href="${profileUrl(statement.uri("acc"))}" title="granted by">${statement.accText!}</a>,&nbsp;<a href="${profileUrl(statement.uri("spec"))}" title="credential specialty">${statement.specText!}</a>
        <#elseif (statement.acc?? && !(statement.spec??))>
            <a href="${profileUrl(statement.uri("acc"))}" title="granted by">${statement.accText!}</a>
        </#if>
    </#local>

    <#local num>
        <#if statement.credNum??>
            &#35;${statement.credNum!}
        </#if>
    </#local>

    <#local label>
        <#if statement.credText??>
            ${statement.credText!}.
        </#if>
    </#local>

${label}${accreditor}${date}${num}
</#macro>