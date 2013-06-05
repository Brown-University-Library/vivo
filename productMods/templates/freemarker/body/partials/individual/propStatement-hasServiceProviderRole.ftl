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
        <#if statement.roleLabel?? && statement.hostLabel??>
            <a href="${profileUrl(statement.uri("role"))}" title="${statement.roleLabel!}">${statement.roleLabel!}. ${statement.hostLabel!}</a>
        <#else>
            <a href="${profileUrl(statement.uri("role"))}" title="${statement.roleLabel!}">${statement.roleLabel!}</a>
        </#if>
    </#local>

    <#local dateTime>
        <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />
    </#local>

     ${linkedIndividual} ${dateTime!}
</#if>
</#macro>
