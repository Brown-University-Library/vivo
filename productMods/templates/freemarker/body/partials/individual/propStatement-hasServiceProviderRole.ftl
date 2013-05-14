<#import "lib-datetime.ftl" as dt>

<@showRole statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showRole statement>
<#if statement.hideThis?has_content>
    <span class="hideThis">&nbsp;</span>
    <script type="text/javascript" >
        $('span.hideThis').parent().parent().addClass("hideThis");
        if ( $('h3#hasResearcherRole').attr('class').length == 0 ) {
            $('h3#hasResearcherRole').addClass('hiddenGrants');
        }
        $('span.hideThis').parent().remove();
    </script>
<#else>
    <#local linkedIndividual>
        <a href="${profileUrl(statement.uri("role"))}" title="${statement.roleLabel!}">${statement.roleLabel!}</a> 
    </#local>
    
    <#local dateTime>
        <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />
    </#local>
    
     ${linkedIndividual}  ${dateTime!} 
</#if>
</#macro>