Profile:        KLCommonCareSocialExplanationOfBenefit
Parent:         ExplanationOfBenefit
Title:          "ExplanationOfBenefit"
Description:    "Documented decisions about what welfare and care citizens are entitled to recieve"

* supportingInfo.category.text = "Planned care"
* supportingInfo.value[x] only Reference(KLCommonCareSocialPlannedIntervention or KLCommonCareSocialCarePlan)
* extension contains
   MunicipalityCaseNumber named municipalityCaseNumber 0..1
* item.adjudication.category from AdjudicationCategoryCodes (required)


* item.productOrService.coding  ^slicing.discriminator.type = #value
* item.productOrService.coding  ^slicing.discriminator.path = "system"
* item.productOrService.coding  ^slicing.rules = #open
* item.productOrService.coding  ^slicing.ordered = false   // can be omitted, since false is the default

* item.productOrService.coding contains
   paragraphOfLawCode 0..1 and KLECode 0..1

* item.productOrService.coding[paragraphOfLawCode] from ParagraphOfLawCodes (required)
* item.productOrService.coding[paragraphOfLawCode].system = Canonical(KLCommonproprietary) 

* item.productOrService.coding[KLECode].system = "http://kl.dk/KLE"

* type from ExtendedClaimTypeCodes (required)
* type = KLCommonproprietary#384485b8-385f-4d34-9cb6-a939fe7ff945 "Kommunalt"
* use = http://hl7.org/fhir/claim-use#predetermination
* outcome = http://hl7.org/fhir/remittance-outcome#complete


* status ^short = "[DK] afgørelsesbrevStatus"
* type ^short = "[DK] afgørelsesbrevSektorkode"
* use ^short = "[DK] afgørelsesbrevBrug"
* patient ^short = "[DK] afgørelsesbrevDrejerSigOm"
* created ^short = "[DK] afgørelsesbrevRegistreringstid"
* disposition ^short = "[DK] afgørelsesbrevBegrundelse"
* insurer ^short = "[DK] afgørelsesbrevTildelendeOrganisation"
* provider ^short = "[DK] afgørelsesbrevLeveringsansvarligOrganisation"
* insurance ^short = "[DK] afgørelsesbrevUdgiftsdækning"
* outcome ^short = "[DK] afgørelsesbrevStatusForIndeholdteYdelsesafgørelser"
* extension[municipalityCaseNumber] ^short = "[DK] afgørelsesbrevIndgårISag"
* supportingInfo.valueReference ^short = "[DK] ydelsesafgørelseErBevilligAfIndsats" 
* item.informationSequence ^short = "[DK] ydelsesafgørelseErBevilligAfIndsats" 
* item.productOrService.text ^short = "[DK] ydelsesafgørelseAnsøgtYdelse"
* item.modifier.coding ^short = "[DK] ydelsesafgørelseSærligAfgørelse"
* item.productOrService.coding ^short = "[DK] ydelsesafgørelseEmneklasse"
* item.adjudication.category ^short = "[DK] ydelsesafgørelsesType"
* item.adjudication.reason.text ^short = "[DK] ydelsesafgørelsesBegrundelse"

Instance: AndreasAfgoerelse
InstanceOf: KLCommonCareSocialExplanationOfBenefit
Title: "Andreas Afgørelse"
Description: "En afgørelse fra kommunen, der er anledning til både en bevilling, og et afslag"
Usage: #example
* status = 	http://hl7.org/fhir/explanationofbenefit-status#active
* type = KLCommonproprietary#384485b8-385f-4d34-9cb6-a939fe7ff945 "Kommunalt"
* use = http://hl7.org/fhir/claim-use#predetermination
* patient = Reference(Andreas)
* created = 2020-07-06
* disposition = "Der er lagt vægt på din udviklingshæmning, og på at din mor ikke kan overkomme din pleje i hjemmet mere, som begrundelse for det midlertidige botilbud. Der er lagt vægt på at du ikke har brug for en støtteperson, fordi dit midlertidige botilbud vil overtage støtteopgaver i det daglige."
* insurer = Reference(SocialOgSundhedMorsoe)
* provider = Reference(SocialOgSundhedMorsoe)
* insurance.coverage = Reference(AndreasUdgiftsdaekning)
* insurance.focal = true
* outcome = http://hl7.org/fhir/remittance-outcome#complete
* extension[municipalityCaseNumber].extension[official].valueIdentifier.use = #official
* extension[municipalityCaseNumber].extension[official].valueIdentifier.system = "https://data.gov.dk/id/organization"
* extension[municipalityCaseNumber].extension[official].valueIdentifier.value = "6f394733-8255-40c3-84ab-737625aeef18"
* supportingInfo.valueReference =  Reference(FFBIndsats)
* supportingInfo.category.text = "Planned care"
* supportingInfo.sequence = 1
* item[0].sequence = 1
* item[0].informationSequence = 1
* item[0].productOrService.text = "Der er ansøgt om midlertidigt botilbud"
* item[0].productOrService.coding = KLCommonproprietary#a65082ee-2537-4359-8d51-62a58714936f "Midlertidige botilbud (SEL § 107)"
* item[0].adjudication.category = KLCommonproprietary#89175d47-e217-4be8-8597-a60584fbd665 "Fuld bevilling"
* item[0].adjudication.reason.text = "Borger er i personkredsen for serviceloven §107, og er i en situation hvor der er et tydeligt behov. Derfor bevilliges hjælp i form af midlertidigt botilbud" 
* item[1].sequence = 2
* item[1].productOrService.text =  "Der er ansøgt om støtteperson" 
* item[1].productOrService.coding = KLCommonproprietary#986166ef-ad4e-4a23-adc3-ea7999f55e70 "Støtte- og kontaktperson (SEL §99)"
* item[1].adjudication.category = KLCommonproprietary#c3d61d25-a972-40b7-9430-530eeab80c38 "Fuldt afslag"
* item[1].adjudication.reason.text = "Der er bevilliget anden hjælp, der gør en støtteperson overflødig"

Instance: AndreasUdgiftsdaekning
InstanceOf: Coverage
Title: "Andreas Udgiftsdækning"
Description: "Andreas' udgiftsdækning"
* status = http://hl7.org/fhir/fm-status#active
* beneficiary = Reference(Andreas)
* payor = Reference(SocialOgSundhedMorsoe)
