Extension: FollowUpEncounter
Title:     "FollowupEncounter"
Description: "Extension for pointing to previous and planned follow up encounters for a condition"

* value[x] 1..1
* value[x] only Reference(KLCommonCareSocialEncounter)

Extension: RequesterType
Title: "RequesterType"
Description: "Extension for pointing to type of organisation/person that requests a service from the municipality"
* value[x] 1..1
* value[x] only CodeableConcept
* value[x] from KLRequestFromFSIII

Extension: SubjectConsentToLiaising
Title: "SubjectConsentToLiaising"
Description: "Extension for describing whether the citizen knows about the request/referal"
* value[x] 1..1
* value[x] only CodeableConcept
* value[x] from KLConsentToLiasing

Extension: ConditionRank
Title: "ConditionRank"
Description: "The rank of a condition. Used for event-resources that refer to conditions that are ranked."
* value[x] 1..1
* value[x] only positiveInt

Extension: BasedOnServiceRequest
Description: "A reference to a ServiceRequest. Used to connect an event resource with the order that warranted it"
Title: "BasedOnServiceRequest"
* value[x] 1..1
* value[x] only Reference(ServiceRequest)

Extension: MatterOfInterestInformer
Title: "MatterOfInterestInformer"
Description: "Extension for pointing to who's perspective the matter-of-interest is comming from"
* value[x] 1..1
* value[x] only CodeableConcept
* value[x] from KLMatterOfInterestInformerFFB