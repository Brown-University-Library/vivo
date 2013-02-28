/* $This file is distributed under the terms of the license in /doc/license.txt$ */

package edu.cornell.mannlib.vitro.webapp.edit.n3editing.configuration.generators;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import com.hp.hpl.jena.vocabulary.XSD;

import edu.cornell.mannlib.vitro.webapp.controller.VitroRequest;
import edu.cornell.mannlib.vitro.webapp.dao.VitroVocabulary;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.AutocompleteRequiredInputValidator;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.VTwo.DateTimeIntervalValidationVTwo;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.VTwo.DateTimeWithPrecisionVTwo;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.VTwo.EditConfigurationVTwo;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.VTwo.fields.ChildVClassesOptions;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.VTwo.fields.ChildVClassesWithParent;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.VTwo.fields.FieldVTwo;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.VTwo.fields.IndividualsViaVClassOptions;
import edu.cornell.mannlib.vitro.webapp.edit.n3editing.configuration.validators.AntiXssValidation;

public class AddPresenterRoleToPersonGenerator extends VivoBaseGenerator implements
        EditConfigurationGenerator {

    final static String presentationClass = vivoCore + "Presentation";
    final static String roleClass = vivoCore + "PresenterRole";
    final static String conferenceClass = bibo + "Conference";
    final static String hasRolePred = vivoCore + "hasPresenterRole";
    final static String roleOfPred = vivoCore + "presenterRoleOf";
    final static String roleRealizedInPred = vivoCore + "roleRealizedIn";
    final static String realizedRolePred = vivoCore + "realizedRole";
    final static String includesEventPred = vivoCore + "includesEvent";
    final static String eventWithinPred = vivoCore + "eventWithin";
    final static String roleToInterval = vivoCore + "dateTimeInterval";
    final static String intervalType = vivoCore + "DateTimeInterval";
    final static String intervalToStart = vivoCore + "start";
    final static String intervalToEnd = vivoCore + "end";
    final static String dateTimeValueType = vivoCore + "DateTimeValue";
    final static String dateTimeValue = vivoCore + "dateTime";
    final static String dateTimePrecision = vivoCore + "dateTimePrecision";
    final static String dateTimePred = vivoCore + "dateTimeValue";

    
    public AddPresenterRoleToPersonGenerator() {}
    
    @Override
    public EditConfigurationVTwo getEditConfiguration(VitroRequest vreq,
            HttpSession session) throws Exception {
        
        EditConfigurationVTwo conf = new EditConfigurationVTwo();
        
        initBasics(conf, vreq);
        initPropertyParameters(vreq, session, conf);
        initObjectPropForm(conf, vreq);               
        
        conf.setTemplate("addPresenterRoleToPerson.ftl");
        
        conf.setVarNameForSubject("person");
        conf.setVarNameForPredicate("predicate");
        conf.setVarNameForObject("role");
        
        conf.setN3Required( Arrays.asList( n3ForNewRole, 
                                           roleLabelAssertion) );
        conf.setN3Optional( Arrays.asList( n3ForNewPresentation, 
                                           n3ForExistingPresentation, 
                                           n3ForNewConferenceNewPres, 
                                           n3ForNewConferenceExistingPres, 
                                           n3ForExistingConferenceNewPres, 
                                           n3ForExistingConferenceExistingPres, 
                                           n3ForDate,
                                           n3ForNewDate
                                           ) );
        
        conf.addNewResource("presentation", DEFAULT_NS_FOR_NEW_RESOURCE);
        conf.addNewResource("newConference", DEFAULT_NS_FOR_NEW_RESOURCE);
        conf.addNewResource("role", DEFAULT_NS_FOR_NEW_RESOURCE);
        conf.addNewResource("dateTimeNode", DEFAULT_NS_FOR_NEW_RESOURCE);
        
        //uris in scope: none   
        //literals in scope: none
        
        conf.setUrisOnform(Arrays.asList("existingPresentation", "existingConference", "presentationType"));
        conf.setLiteralsOnForm(Arrays.asList("presentationLabel", "presentationLabelDisplay", "conferenceLabel", "conferenceLabelDisplay", "roleLabel"));
        
        conf.addSparqlForExistingLiteral("presentationLabel", presentationLabelQuery);
        conf.addSparqlForExistingLiteral("conferenceLabel", conferenceLabelQuery);
        conf.addSparqlForExistingLiteral("roleLabel", roleLabelQuery);
        conf.addSparqlForExistingUris("existingPresentation", presentationQuery);
        conf.addSparqlForExistingUris("existingConference", existingConferenceQuery);
        conf.addSparqlForExistingUris("presentationType", presentationTypeQuery);
        conf.addSparqlForExistingLiteral(
                "dateField-value", existingDateQuery);
        conf.addSparqlForExistingUris("dateTimeNode", existingDateNodeQuery);
        conf.addSparqlForExistingUris("dateField-precision", 
                existingDatePrecisionQuery);
        
        conf.addField( new FieldVTwo(). // an autocomplete field
                setName("existingPresentation") 
                );

        conf.addField( new FieldVTwo().                        
                setName("presentationLabelDisplay")
                .setRangeDatatypeUri( XSD.xstring.toString() ).
                setValidators( list("datatype:" + XSD.xstring.toString()) )
                );

        conf.addField( new FieldVTwo().                        
                setName("presentationLabel")
                .setRangeDatatypeUri( XSD.xstring.toString() ).
                setValidators( list("datatype:" + XSD.xstring.toString()) )
                );
        
        conf.addField( new FieldVTwo().
                setName("presentationType").
                setValidators( list("nonempty") ).
                setOptions( new ChildVClassesWithParent(
                        presentationClass))                                
                );
 
        conf.addField( new FieldVTwo().                        
                setName("roleLabel")
                .setRangeDatatypeUri( XSD.xstring.toString() ).
                setValidators( list("nonempty") )
                );

        conf.addField( new FieldVTwo(). // an autocomplete field
                setName("existingConference") 
                );
        
        conf.addField( new FieldVTwo().
                setName("conferenceLabel").
                setRangeDatatypeUri(XSD.xstring.toString() )
                );
        
        conf.addField( new FieldVTwo().
                setName("conferenceLabelDisplay").
                setRangeDatatypeUri(XSD.xstring.toString() )
                );
        
        conf.addField( new FieldVTwo().setName("dateField").
                setEditElement( 
                        new DateTimeWithPrecisionVTwo(null, 
                                VitroVocabulary.Precision.YEAR.uri(),
                                VitroVocabulary.Precision.NONE.uri())
                              )
                );
        conf.addValidator(new AntiXssValidation());
        conf.addValidator(new AutocompleteRequiredInputValidator("existingPresentation", "presentationLabel"));
        prepare(vreq, conf);
        return conf;
    }

    /* N3 assertions  */
    final static String n3ForNewRole = 
        "@prefix core: <" + vivoCore + "> . \n\n" +   
        "?person <" + hasRolePred + ">  ?role . \n" +
        "?role a  <" + roleClass + "> . \n" +              
        "?role <" + roleOfPred + "> ?person . ";
         
    final static String roleLabelAssertion =
        "?role <" + label + "> ?roleLabel .";
        
    final static String n3ForNewPresentation = 
        "?role <" + roleRealizedInPred + "> ?presentation . \n" + 
        "?presentation <" + realizedRolePred + "> ?role . \n" +    
        "?presentation <" + label + "> ?presentationLabel . \n" +
        "?presentation a ?presentationType .";
    
    final static String n3ForExistingPresentation = 
        "?role <" + roleRealizedInPred + "> ?existingPresentation . \n" + 
        "?existingPresentation <" + realizedRolePred + "> ?role . \n" +
        "?existingPresentation a ?presentationType .";
        
    final static String n3ForNewConferenceNewPres =
        "?presentation <" + eventWithinPred + "> ?newConference . \n" +
        "?newConference <" + includesEventPred + "> ?presentation . \n" +
        "?newConference a <" +  conferenceClass + "> . \n" +
        "?newConference <" + label + "> ?conferenceLabel .";

    final static String n3ForNewConferenceExistingPres =
        "?existingPresentation <" + eventWithinPred + "> ?newConference . \n" +
        "?newConference <" + includesEventPred + "> ?existingPresentation . \n" +
        "?newConference a <" +  conferenceClass + "> . \n" +
        "?newConference <" + label + "> ?conferenceLabel .";
    
    final static String n3ForExistingConferenceNewPres =
        "?existingConference <" + includesEventPred + "> ?presentation . \n" +
        "?presentation <" + eventWithinPred + "> ?existingConference . \n" +
        "?presentation <" + label + "> ?presentationLabel . ";
    
    final static String n3ForExistingConferenceExistingPres =
        "?existingConference <" + includesEventPred + "> ?existingPresentation . \n" +
        "?existingPresentation <" + eventWithinPred + "> ?existingConference . ";

    final static String n3ForDate =
        "?role <" + dateTimePred + "> ?dateTimeNode . \n" +    
        "?dateTimeNode a <" + dateTimeValueType + "> . \n" +
        "?dateTimeNode  <" + dateTimeValue + "> ?dateField-value . \n" +
        "?dateTimeNode  <" + dateTimePrecision + "> ?dateField-precision . \n";

    final static String n3ForNewDate =
        "?role <" + dateTimePred + "> ?dateTimeNode . \n" +
        "?dateTimeNode a <" + dateTimeValueType + "> . \n" +
        "?dateTimeNode <" + dateTimeValue + "> ?dateField-value . \n" +
        "?dateTimeNode <" + dateTimePrecision + "> ?dateField-precision .";
        
    /* Queries for editing an existing entry */
    final static String roleLabelQuery =
        "SELECT ?existingRoleLabel WHERE { \n" +
        "?role <" + label + "> ?existingRoleLabel . }";
    
    final static String presentationQuery = 
        "SELECT ?existingPresentation WHERE { \n" +
        "?role <" + roleRealizedInPred + "> ?existingPresentation . }";
    
    final static String presentationLabelQuery =
        "SELECT ?existingPresentationLabel WHERE { \n" +
        "?role <" + roleRealizedInPred + "> ?existingPresentation . " +
        "?existingPresentation <" + label + "> ?existingPresentationLabel . }";
    
    final static String presentationTypeQuery = 
        "PREFIX vitro: <" + VitroVocabulary.vitroURI + "> \n" +
        "SELECT ?existingPresentationType WHERE { \n" + 
        "?role <" + roleRealizedInPred + "> ?existingPresentation . " +
        "?existingPresentation vitro:mostSpecificType ?existingPresentationType . }";
    
    final static String existingConferenceQuery = 
        "SELECT ?existingConference WHERE { \n" +
        "?role <" + roleRealizedInPred + "> ?existingPresentation . " +
        "?existingPresentation <" + eventWithinPred + "> ?existingConference . }";
    
    final static String conferenceLabelQuery =
        "SELECT ?existingConferenceLabel WHERE { \n" +
        "?role <" + roleRealizedInPred + "> ?existingPresentation . " +
        "?existingPresentation <" + eventWithinPred + "> ?existingConference . \n" +
        "?existingConference <" + label + "> ?existingConferenceLabel . }";
    
    final static String existingDateQuery =
        "SELECT ?existingDateStart WHERE { \n" +
        "  ?role <" + dateTimePred + "> ?dateTimeNode . \n" +
        "  ?dateTimeNode a <" + dateTimeValueType +"> . \n" +
        "  ?dateTimeNode <" + dateTimeValue + "> ?existingDateStart . }";
    
    final static String existingDateNodeQuery = 
        "SELECT ?existingDateNode WHERE { \n" +
        "  ?role <" + dateTimePred + "> ?existingDateNode . \n" +
        "  ?existingDateNode a <" + dateTimeValueType + "> . }   ";
    
    final static String existingDatePrecisionQuery = 
        "SELECT ?existingStartPrecision WHERE { \n" +
        "  ?role <" + dateTimePred + "> ?dateNode . \n" +
        "  ?dateNode a  <" + dateTimeValueType + "> . \n" +           
        "  ?dateNode <" + dateTimePrecision + "> ?existingStartPrecision . }";
    
}
