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

    <#local employer>
        <#if (statement.emp?? && statement.hdept??)>
            <a href="${profileUrl(statement.uri("emp"))}" title="granted by">${statement.empText!}</a>,&nbsp;${statement.hdept!}
        <#elseif (statement.emp?? && !(statement.hdept??))>
            <a href="${profileUrl(statement.uri("emp"))}" title="granted by">${statement.empText!}</a>
        </#if>
    </#local>

    <#local label>
        <#if statement.happtText??>
            ${statement.happtText!}.
        </#if>
    </#local>

${label}${employer}${date}
</#macro>