<#-- Brown canonical course pages  -->

<@showRole statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showRole statement>
    <#local linkedIndividual>
        <#if statement.facLabel??>
            <a href="${profileUrl(statement.uri("faculty"))}" title="instructor">${statement.facLabel}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("course"))}" title="missing activity">missing activity</a>
        </#if>
    </#local>
    
    ${linkedIndividual} ${statement.termList!}. 
</#macro>
