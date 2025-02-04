import "@typespec/http";

import "../entities/politician.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Politicians;

model AllQueryOptions {
	...EntityListQueryOptions;

	@query
	first_name?: string;

	@query
	last_name?: string;

	@query
	birth_name?: string;

	@query
	sex?: "m" | "f" | "d";

	@query
	year_of_birth?: integer;

	@query
	party_past?: string;

	@query
	education?: string;

	@query
	residence?: string;

	@query
	statistic_questions?: integer;

	@query
	statistic_questions_answered?: integer;

	@query
	qid_wikidata?: string;

	@query
	ext_id_bundestagsverwaltung?: string;

	@query
	field_title?: string;
}

alias Endpoints = EntityEndpoint<Politician>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
