<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for foaf:Organization individuals (extends individual.ftl in vivo)-->

<#-- Do not show the link for temporal visualization unless it's enabled -->
<#if temporalVisualizationEnabled>
    <#assign classSpecificExtension>
        <section id="visualization" role="region">
            <#include "individual-visualizationTemporalGraph.ftl">
            <#include "individual-visualizationMapOfScience.ftl">
        </section> <!-- #visualization -->
    </#assign>
</#if>
<#if individual.uri == 'http://vivo.brown.edu/individual/org-brown-univ'>
    <#--include "brown-univ-individual.ftl"-->
    <header id="individual-info"><h1 class="fn">Brown University</h1></header>
<#else>
    <#include "individual.ftl">
</#if>
