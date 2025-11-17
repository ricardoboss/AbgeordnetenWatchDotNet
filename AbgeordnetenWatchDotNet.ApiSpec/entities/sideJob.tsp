import "./entity.tsp";
import "./candidacyMandate.tsp";
import "./sideJobOrganization.tsp";
import "./city.tsp";
import "./country.tsp";
import "./topic.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Sidejob extends Entity {
	entity_type: "side_job";

	@encodedName("application/json", "job_title_extra")
	jobTitleExtra: string;

	@encodedName("application/json", "additional_information")
	additionalInformation: string;

	mandates: SubReference<CandidacyMandate>[];

	category: SidejobCategory;

	@encodedName("application/json", "income_level")
	incomeLevel: SidejobIncomeLevel;

	interval: SidejobInterval;

	@encodedName("application/json", "data_change_date")
	dataChangeDate: plainDate;

	created: integer;

	@encodedName("application/json", "sidejob_organization")
	organization: SubReference<SidejobOrganization>;

	@encodedName("application/json", "field_city")
	fieldCity: SubReference<City>;

	@encodedName("application/json", "field_country")
	fieldCountry: SubReference<Country>;

	@encodedName("application/json", "field_topics")
	fieldTopics: Reference<Topic>[];

	income: decimal;

	@encodedName("application/json", "income_total")
	incomeTotal: SideJobIncomeTotal[];
}

alias SidejobCategory =
	| "29231" // Beteiligung an Kapital- oder Personengesellschaften
	| "29647" // Entgeltliche Tätigkeiten neben dem Mandat
	| "29229" // Funktionen in Körperschaften und Anstalten des öffentlichen Rechts
	| "29228" // Funktionen in Unternehmen
	| "29230" // Funktionen in Vereinen, Verbänden und Stiftungen
	| "29232" // Spenden/Zuwendungen für politische Tätigkeit
	| "29233" // Vereinbarungen über künftige Tätigkeiten oder Vermögensvorteile
	| "29234"; // Berufliche Tätigkeit vor der Mitgliedschaft im Deutschen Bundestag

alias SidejobIncomeLevel =
	| "0" // 1 € bis 1.000 €
	| "1" // 1.000 € bis 3.500 €
	| "2" // 3.500 € bis 7.000 €
	| "3" // 7.000 € bis 15.000 €
	| "4" // 15.000 € bis 30.000 €
	| "5" // 30.000 € bis 50.000 €
	| "6" // 50.000 € bis 75.000 €
	| "7" // 75.000 € bis 100.000 €
	| "8" // 100.000 € bis 150.000 €
	| "9" // 150.000 € bis 250.000 €
	| "10"; // ab 250.000 €

alias SidejobInterval = "0" | "1" | "2"; // einmalig // monatlich // jährlich

model SideJobIncomeTotal {
	date: plainDate;
	total: decimal;
}
