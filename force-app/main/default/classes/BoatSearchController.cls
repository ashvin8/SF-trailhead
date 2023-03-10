/**
 * @description       : 
 * @author            : YMU
 * @group             : 
 * @last modified on  : 20-08-2021
 * @last modified by  : YMU
**/
public with sharing class BoatSearchController {

	@AuraEnabled
    public static List<BoatType__c> getBoatTypes() {	
		/*
		Best Practice - Chekc if selected fields by getBoatTypes are accessiable to the current user.
		*/
		if ((!Schema.SObjectType.BoatType__c.fields.Id.isAccessible()) ||
			(!Schema.SObjectType.BoatType__c.fields.Name.isAccessible())) {
				throw new System.NoAccessException();
		}
	
        List<BoatType__c> btList = [SELECT Id, Name FROM BoatType__c];
        System.debug('BoatSearchFormController.getBoatTypes-btList='+btList);
       return btList;
    }
}