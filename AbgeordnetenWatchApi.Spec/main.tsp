import "@typespec/openapi";
import "@typespec/http";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@service()
@info({
	title: "AbgeordnetenWatch API",
	version: "2.0.0",
	license: {
		name: "CC0 1.0",
		url: "https://creativecommons.org/publicdomain/zero/1.0/deed.de",
	},
})
@externalDocs("https://www.abgeordnetenwatch.de/api")
namespace AbgeordnetenWatch;

@route("/parliaments")
namespace Parliaments {
	op all(@query label?: string, @query label_external_long?: string): ListResponse<Parliament>;

	@route("/{id}")
	op get(id: integer, related_data?: "show_information"): EntityResponse<Parliament>;
}

@route("/votes")
namespace Votes {
	op all(@query vote?: VoteResult, @query reason_no_show?: NoShowReason, @query reason_no_show_other?: string): ListResponse<Vote>;

	@route("/{id}")
	op get(id: integer, related_data?: "show_information"): EntityResponse<Vote>;
}

@route("/polls")
namespace Polls {
	op all(@query label?: string, @query field_accepted?: 1 | 0): ListResponse<Poll>;

	@route("/{id}")
	op get(id: integer, related_data?: "show_information"): EntityResponse<Poll>;
}

@route("/parties")
namespace Parties {
	op all(@query label?: string, @query full_name?: string, @query short_name?: string): ListResponse<Party>;

	@route("/{id}")
	op get(id: integer, related_data?: "show_information"): EntityResponse<Party>;
}

@route("/constituencies")
namespace Constituencies {
	op all(@query label?: string, @query name?: string, @query number?: integer): ListResponse<Constituency>;

	@route("/{id}")
	op get(id: integer): EntityResponse<Constituency>;
}

@route("/electoral_lists")
namespace ElectoralLists {
	op all(@query label?: string, @query name?: string): ListResponse<ElectoralList>;

	@route("/{id}")
	op get(id: integer): EntityResponse<ElectoralList>;
}

@route("/politicians")
namespace Politicians {
	op all(@query label?: string, @query first_name?: string, @query last_name?: string, @query birth_name?: string, @query sex?: "m" | "f" | "d", @query year_of_birth?: integer, @query party_past?: string, @query education?: string, @query residence?: string, @query statistic_questions?: integer, @query statistic_questions_answered?: integer, @query qid_wikidata?: string, @query ext_id_bundestagsverwaltung?: string, @query field_title?: string): ListResponse<Politician>;

	@route("/{id}")
	op get(id: integer, related_data?: "show_information"): EntityResponse<Politician>;
}

model BaseResponse {
	meta: Meta;
}

model EntityResponse<T extends Entity> extends BaseResponse {
	data: T;
}

model ListResponse<T extends Entity> extends BaseResponse {
	data: T[];
}

model Meta {
	@encodedName("application/json", "abgeordnetenwatch_api")
	api: ApiMeta;

	status: Status;

	@encodedName("application/json", "status_message")
	statusMessage: string;

	result: ResultMeta;
}

model ApiMeta {
	version: string;

	changelog: url;

	@encodedName("application/json", "licence")
	license: string;

	@encodedName("application/json", "licence_link")
	licenseUrl: url;

	documentation: url;
}

enum Status {
	ok,
	warning,
	error
}

model ResultMeta {
	count: integer;

	total: integer;

	@encodedName("application/json", "range_start")
	rangeStart?: integer;

	@encodedName("application/json", "range_end")
	rangeEnd?: integer;

	page?: integer;

	@encodedName("application/json", "results_per_page")
	resultsPerPage?: integer;
}

model Entity {
	@summary("Die eindeutige Id der Entität")
	@key id: integer;

	@summary("Die eindeutige Id des Entitätstyps")
	@encodedName("application/json", "entity_type")
	entityType: string;

	@summary("Das Label / die Bezeichnung der Entität")
	label: string;

	@summary("Der API-Pfad, unter dem die einzelne Entität aufgerufen werden kann")
	@encodedName("application/json", "api_url")
	apiUrl: url;
}

model RegularEntity extends Entity {
	@summary("Die URL zur Detailansicht für diese Entität auf abgeordnetenwatch.de")
	@encodedName("application/json", "abgeordnetenwatch_url")
	abgeordnetenwatchUrl: url;
}

model Reference<T extends RegularEntity> {
	...RegularEntity;
}

model SubReference<T extends Entity> {
	...Entity;
}

model CandidacyMandate extends Entity {
	@encodedName("application/json", "id_external_administration")
	idExternalAdministration: string;

	@encodedName("application/json", "id_external_administration_description")
	idExternalAdministrationDescription: string;

	type: "candidacy" | "mandate";

	@encodedName("application/json", "parliament_period")
	parliamentPeriod: Reference<ParliamentPeriod>;

	politician: Reference<Politician>;

	party: Reference<Party>;

	@encodedName("application/json", "start_date")
	startDate: plainDate | null;

	@encodedName("application/json", "end_date")
	endDate: plainDate | null;

	info: string;

	@encodedName("application/json", "electoral_data")
	electoralData: ElectoralData;

	@encodedName("application/json", "fraction_membership")
	fractionMembership: FractionMembership[];
}

model ElectoralData {
	@encodedName("application/json", "electoral_list")
	electoralList: Reference<ElectoralList>;

	@encodedName("application/json", "list_position")
	listPosition: integer;

	constituency: Reference<Constituency>;

	@encodedName("application/json", "constituency_result")
	constituencyResult: float;

	@encodedName("application/json", "constituency_result_count")
	constituencyResultCount: integer;

	@encodedName("application/json", "mandate_won")
	mandateWon: "constituency" | "list" | "moved_up";
}

model FractionMembership {
	label: string;

	faction: Reference<Fraction>;

	@encodedName("application/json", "valid_from")
	validFrom: plainDate;

	@encodedName("application/json", "valid_until")
	validUntil: plainDate;
}

model Parliament extends RegularEntity {
	@summary("Eine lange Bezeichnung für das Parlament, z.B. \"Abgeordnetenhaus von Berlin\"")
	label_external_long: string;

	current_project: Reference<ParliamentPeriod>;
}

model ParliamentPeriod extends RegularEntity {
	@summary("Definiert das Parlament, zu dem diese Parlamentsperiode gehört")
	parliament: Reference<Parliament>;

	@summary("Die Parlamentsperiode, auf welche die Parlamentsperiode folgt. Im Moment wurde das Feld nur für Legislaturen gepflegt, um die vorherige Wahlperiode zu definieren")
	previous_period: Reference<ParliamentPeriod>;

	type: string;

	@encodedName("application/json", "election_date")
	electionDate: plainDate;

	@encodedName("application/json", "start_date_period")
	startDatePeriod: plainDate;

	@encodedName("application/json", "end_date_period")
	endDatePeriod: plainDate;
}

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

model Party extends RegularEntity {
	@encodedName("application/json", "full_name")
	fullName: string;

	@encodedName("application/json", "short_name")
	shortName: string;
}

model Fraction extends RegularEntity {
	@encodedName("application/json", "full_name")
	fullName: string;

	@encodedName("application/json", "short_name")
	shortName: string;

	legislature: Reference<ParliamentPeriod>;
}

model Poll extends RegularEntity {
	@encodedName("application/json", "field_committees")
	fieldCommittees: Reference<Comittee>;

	@encodedName("application/json", "field_intro")
	fieldIntro: string;

	@encodedName("application/json", "field_legislature")
	fieldLegislature: Reference<ParliamentPeriod>;

	@encodedName("application/json", "field_poll_date")
	fieldPollDate: plainDate;

	@encodedName("application/json", "field_accepted")
	fieldAccepted: boolean;

	@encodedName("application/json", "field_related_links")
	fieldRelatedLinks: { uri: url; title: string; }[];

	@encodedName("application/json", "field_topics")
	fieldTopics: Reference<Topic>[];
}

model Topic extends RegularEntity {
	description: string;

	parent?: Reference<Topic>;
}

model Comittee extends RegularEntity {
	@encodedName("application/json", "field_legislature")
	fieldLegislature: Reference<ParliamentPeriod>;

	@encodedName("application/json", "field_topics")
	fieldTopics: Reference<Topic>[];
}

model Constituency extends RegularEntity {
	name: string;

	number: integer;

	@encodedName("application/json", "parliament_period")
	parliamentPeriod: Reference<ParliamentPeriod>;
}

model ElectoralList extends RegularEntity {
	name: string;

	@encodedName("application/json", "parliament_period")
	parliamentPeriod: Reference<ParliamentPeriod>;
}

alias VoteResult = "yes" | "no" | "no_show";
alias NoShowReason = "maternity_protection" | "fell_ill" | "other";

model Vote extends Entity {
	mandate: SubReference<CandidacyMandate>;

	faction: Reference<Fraction>;

	poll: Reference<Poll>;

	vote: VoteResult;

	@encodedName("application/json", "reason_no_show")
	reasonNoShow: NoShowReason | null;

	@encodedName("application/json", "reason_no_show_other")
	reasonNoShowOther: string | null;
}
