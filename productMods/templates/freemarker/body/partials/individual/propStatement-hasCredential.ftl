<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#hasRole and its child properties.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<@showRole statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showRole statement>
<#local linkedIndividual>
    <#if statement.course??>
        ${statement.label!}.  ${statement.termList!}.
    </#if>
</#local>

${linkedIndividual}
</#macro>
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
        <#if (statement.start?? && !(statement.end??)>
            ${statement.start}&nbsp;
        <#elseif (statement.start?? && statement.end??)>
            ${statement.start}&nbsp;-&nbsp;${statement.end}&nbsp;
        </#if>
    </#local>

    <#local linkedAcc>
        <#if statement.acc??>
            <a ${profileUrl(statement.uri("acc"))}" title="accreditor name">${statement.accText!}</a>
        </#if>
    </#local>

    <#local linkedSpec>
        <#if statement.spec??>
            ,&nbsp;<a ${profileUrl(statement.uri("spec"))}" title="credential specialty">${statement.specText!}</a>
        </#if>
    </#local>

    <#local num>
        <#if statement.credNum??>
            ,&nbsp;${statement.credNum!}
        </#if>
    </#local>

${date}${statement.credText}${linkedAcc}${linkedSpec}${num}
</#macro>