<#--
Copyright (c) 2012, Cornell University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    * Neither the name of Cornell University nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-->

<@widget name="login" include="assets" />
<#include "browse-classgroups.ftl">

<!DOCTYPE html>
<html lang="en">
    <head>
        <#include "head.ftl">
    </head>

    <body class="${bodyClasses!}" onload="${bodyOnload!}">
        <#include "identity.ftl">

        <#include "menu.ftl">

            <h2>Welcome to Researchers@Brown</h2>

 			<p>
			Researchers@Brown brings together in one site publicly available information on the people, departments, and
			activities that collectively make up research and scholarship in all disciplines at Brown. Information in the
			initial release of Researchers@Brown comes from institutional sources and from data entered by faculty in the
			Directory of Research and Researchers at Brown (DRR-B). When Researchers@Brown launches publicly it will replace the DRR-B
			and existing DRR-B profiles will be automatically redirected to profiles on this site.
 			</p>

 			<p>
 		Faculty members not included in the initial launch can request a profile by contacting their dean's office.
 			</p>
           <p>
 			Please report issues or request help by contacting <a href="mailto:vivoteam@brown.edu">Margaret_Houska@brown.edu</a>.
 			Visit our <a href="./about">About page</a> for further information.</p>

    <#include "footer.ftl">
    </body>
</html>
