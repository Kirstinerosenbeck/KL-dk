### Scope and usage
KLCommonCareSocialExplanationOfBenefit is a documentation of a number of decisions/adjudications made in the same case management process in a Danish Municipality e.g. related to a single workflow, case or related to the same request/referal. It might be the case that only one decision is included. This is called a decision letter (Afgørelsesbrev) wheras each of the included decisions/adjudications are called intervention level decision (Ydelsesafgørelse). 

The primary actors of a typical municipality decision is the citizen and the municipality. However, FHIR has its origin in states with health insurences, and this information have to be filled out regardless that Denmark does not have this structure in its public health system. So for most simple cases the citizen goes in ExplanationOfBenefit.patient and ExplanationOfBenefit.insurance.beneficiary, and the Municipality is reprensented in the  ExplanationOfBenefit.insurer ExplanationOfBenefit.provider and ExplanationOfBenefit.insurance.payor.

The relationship between a decision letter and a municipality case, can be registered using the ExplanationOfBenefit:extension.municipalityCaseNumber.

The reasons and/or background for a decision letter can be described in ExplanationOfBenefit.disposition. The time where alle the decisions were made, and the municipality is ready to let the citizen know, which decisions have been reached is the ExplanationOfBenefit.created.

There is a number of type and status fields that must be filled out. The first is ExplanationOfBenefit.status. This attribute has a mandatory FHIR valueset, that makes it possible to correct records entered in error etc. Hovewer, for most use cases it should just be set to "active". The last three just have one fixed value for all municipality use cases:
* ExplanationOfBenefit.type should be set to 384485b8-385f-4d34-9cb6-a939fe7ff945 "Kommunalt"
* ExplanationOfBenefit.use should be set to "predetermination"
* ExplanationOfBenefit.outcome should be set to "complete"

In ExplanationOfBenefit.supportingInfo, all planned interventions or care plans resulting from the decisions can be referenced.

Everything related to the intervention level decisions is listed in ExplanationOfBenefit.item. One item is present for each intervention level decision.

item.informationSequence keeps track on, which of the previously listed planned interventions/care plans relates to which intervention level decision. 

In item.productOrService.text the care/service requested may be explained in plain text. item.productOrService.coding classifies the requested care/service using codes that represents paragraphs of law, or KLE-codes. item.modifier.coding codes special decisions such as citizens access to case documents (aktindsigt, procesledende beslutninger ophøjet til afgørelser og forvaltningsvirksomhed ophøjet til afgørelse). They are modifiers because they change the meaning of the productOrService code.

The decision itself is registered in item.adjudication.category and explained in item.adjudication.reason.text

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter, der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk, og specificerer hvilke af FHIR-profilens atributter, der skal bruges til specifikation af indholdet.

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|afgørelsesbrevStatus|indikation af om afgørelsens er aktiv eller er en fejl. |ExplanationOfBenefit.status|
|afgørelsesbrevSektorkode|angivelse af, at afgørelsen vedrører et kommunalt anliggende. |ExplanationOfBenefit.type|
|afgørelsesbrevBrug|Angivelse af, at dette er en endelig beslutning af, at det afgjorte er gældende.|ExplanationOfBenefit.use
|afgørelsesbrevDrejerSigOm|Den borger, som det ansøgte vil tilgodese|ExplanationOfBenefit.patient|
|afgørelsesbrevRegistreringstid|Tidspunkt, hvor der er kommet en afgørelse i forbindelse med en sag eller anmodning om ydelser. Typisk datoen for udsendelse af afgørelsesbrev.|ExplanationOfBenefit.created|
|afgørelsesbrevBegrundelse|Baggrund og begrundelse for afgørelser i brevet |ExplanationOfBenefit.disposition|
|afgørelsesbrevTildelendeOrganisation|Kommune der afgør og tildeler|ExplanationOfBenefit.insurer|
|afgørelsesbrevLeveringsansvarligOrganisation| Kommune der leverer eventuelle ydelser|ExplanationOfBenefit.provider|
|afgørelsesbrevStatusForIndeholdteYdelsesafgørelser|Angivelse af, at dette er et færdigt afgørelsesbrev, hvor der er taget stilling til de indeholdet ydelsesafgørelser|ExplanationOfBenefit.outcome|
|afgørelsesbrevIndgårISag|Kommunalt sagsnummer på den sag, som afgørelsesbrevet vedrører. Enten officielt uuid eller kommune-specifikt nummer|ExplanationOfBenefit:extension.municipalityCaseNumber|
|ydelsesafgørelseErBevilligAfIndsats|De fagligt planlagte indsatser/ydelser som ydelsesafgørelsen er bevillig af.|ExplanationOfBenefit.supportingInfo.valueReference|
|ydelsesafgørelseErBevilligAfIndsats|De fagligt planlagte indsatser/ydelser som ydelsesafgørelsen er bevillig af.|ExplanationOfBenefit.item.informationSequence|
|ydelsesafgørelseAnsøgtYdelse|Det der er ansøgt om udtrykt i tekst inklusiv hvad der ansøges om, og i hvilket omfang |ExplanationOfBenefit.item.productOrService.text|
|ydelsesafgørelseEmneklasse|Den ydelse der er ansøgt om udtrykt som en eller flere koder, eksempelvis paragrafområde, KLE-nummer eller ydelse/indsatskode.|ExplanationOfBenefit.item.productOrService.coding|
|ydelsesafgørelseSærligAfgørelse| En af specialkoderne: aktindsigt, procesledende beslutning ophøjet til afgørelse, og forvaltningsvirksomhed ophøjet til afgørelse. |ExplanationOfBenefit.item.modifier.coding|
|ydelsesafgørelsesType|Hvilken afgørelse der er truffet, valgt ud fra ankestyrelsens afgørelsestyper|ExplanationOfBenefit.item.adjudication.category|
|ydelsesafgørelsesBegrundelse|Begrundelse for afgørelsen inkl. udmåling af omfang, hvis relevant.|ExplanationOfBenefit.item.adjudication.reason.text|