<#import "lib-sequence.ftl" as s>
---------------
<@showAffiliation statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showAffiliation statement>
    
    <#if statement.org??>
       <a href="${profileUrl(statement.uri("org"))}" title="organization name">${statement.orgName}</a>
    </#if>

</#macro>

