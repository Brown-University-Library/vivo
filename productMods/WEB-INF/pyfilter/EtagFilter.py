"""
Servlet filter to generate Etags for VIVO.
"""

from java.io import File
from java.io import FileInputStream
from java.util import Properties
from javax.servlet import Filter
from javax.servlet.http import HttpServletResponse

#Python
import contextlib
import os
import json
import urllib
from urlparse import urlparse

#Read VIVO deploy.properties file.
webinf = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
properties_file = os.path.join(webinf, 'classes/deploy.properties')
in_stream = FileInputStream(properties_file)
properties = Properties()
properties.load(in_stream) 

TOMCAT_HOME = properties.getProperty('tomcat.home').strip()

#setup logging
#TODO: make logging level conditional on the development setting in deploy.properties
import logging
logging.basicConfig(
	level=logging.INFO,
	filename=os.path.join(TOMCAT_HOME, 'logs/vivo-etag-cache.log'),
	filemode='w', 
	format='%(asctime)s - %(levelname)s - %(message)s'
)

VIVO_SOLR = properties.getProperty('vitro.local.solr.url').strip()
VIVO_NS = properties.getProperty('Vitro.defaultNamespace').strip()
ETAG_FIELD = 'etag'

class EtagFilter(Filter):
    
    def get_solr_doc(self, vivo_id):
        query = 'select/?q=URI:%(ns)s%(id)s&wt=json&fl=%(fields)s'
        params = query % {'ns': VIVO_NS,
                'id': vivo_id,
                'fields': ETAG_FIELD}
        solr_query_url = VIVO_SOLR + '/' + params
        logging.debug("Solr URL: " + solr_query_url)
        try:
            with contextlib.closing(urllib.urlopen(solr_query_url)) as solr_handle:
                solr_resp = json.load(solr_handle)
        except Exception, e:
            logging.error("Failed to connect to Solr with:")
            logging.error(e)
            return
        try:
            solr_doc = solr_resp['response']['docs'][0]
        except IndexError:
            logging.debug("No Solr document for for %s." % vivo_id)
            return
        return solr_doc


    def get_etag(self, solr_doc):
        if solr_doc is None:
            logging.debug("No Solr document found.")
            return
        etag = solr_doc.get(ETAG_FIELD)
	if etag is None:
	    logging.debug("No ETag found in Solr doc.")
        return etag


    def get_url_individual(self, url_string):
        p = urlparse(url_string)
        individual = p.path.split('/')[-1]
        return individual

    def doFilter(self, request, response, chain):
        #Don't generate etags for logged in users.  
        login_status = request.session.getValue('loginStatus')
        if (login_status) and (login_status.isLoggedIn()):
            logging.debug("User is logged in.  Caching disabled.")
            #ToDo: figure out best way to do this with mod_cache
            #Tell mod_cache to never cache this page
            response.setHeader("Vary", "*")
        else:
            url_string = str(request.getRequestURL())
            individual = self.get_url_individual(url_string)
            doc = self.get_solr_doc(individual)
            etag = self.get_etag(doc)
            if etag is not None:
                non_match = request.getHeader("If-None-Match")
                #If we have an incoming matching etag return 304.
                if (non_match) and (non_match == etag):
                    logging.debug('Etag matched.') 
                    return response.sendError(HttpServletResponse.SC_NOT_MODIFIED)
                else:
                    logging.debug('Etag did not match.')
                    #Else set the new etag.
                    response.setHeader("ETag", '%s' % etag)
        #Always
        chain.doFilter(request, response)
