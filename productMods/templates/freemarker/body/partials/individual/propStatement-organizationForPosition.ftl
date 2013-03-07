<#import "lib-datetime.ftl" as dt>

<@showPosition statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showPosition statement>
<#if statement.hideThis?has_content>
    <span class="hideThis">&nbsp;</span>
    <script type="text/javascript" >
        $('span.hideThis').parent().parent().addClass("hideThis");
        if ( $('h3#organizationForPosition').attr('class').length == 0 ) {
            $('h3#organizationForPosition').addClass('hiddenPeople');
        }
        $('span.hideThis').parent().remove();
    </script>
<#else>    
    <#local linkedIndividual>
        <#if statement.person??>
            <a href="${profileUrl(statement.uri("person"))}" title="person name">${statement.personName}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("position"))}" title="missing person">missing person in this position</a>
        </#if>
    </#local>

    <#local preferredTitle>
        <#if statement.honoraryTitle??>
            ${statement.honoraryTitle}
        <#else>
            ${statement.positionTitle!}
        </#if>
    </#local>

    <@s.join [ linkedIndividual, preferredTitle] /> <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />

</#if>
</#macro>