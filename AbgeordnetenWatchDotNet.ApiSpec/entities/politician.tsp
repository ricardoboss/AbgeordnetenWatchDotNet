import "./regularEntity.tsp";
import "./party.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Politician extends RegularEntity {
	@encodedName("application/json", "first_name")
	firstName: string;

	@encodedName("application/json", "last_name")
	lastName: string;

	@encodedName("application/json", "birth_name")
	birthName: string | null;

	sex: "m" | "f" | "d" | null;

	@encodedName("application/json", "year_of_birth")
	yearOfBirth: integer;

	party: Reference<Party>;

	@encodedName("application/json", "party_past")
	partyPast: string;

	education: string;

	residence: string;

	@encodedName("application/json", "statistic_questions")
	@encode(string)
	statisticQuestions: integer;

	@encodedName("application/json", "statistic_questions_answered")
	@encode(string)
	statisticQuestionsAnswered: integer;

	@encodedName("application/json", "qid_wikidata")
	qidWikidata: string;

	@encodedName("application/json", "ext_id_bundestagsverwaltung")
	extIdBundestagsverwaltung: string;

	@encodedName("application/json", "field_title")
	fieldTitle: string;
}
