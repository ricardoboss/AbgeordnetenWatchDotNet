import "@typespec/http";

import "../entities/candidacyMandate.tsp";
import "../framework/entityEndpoint.tsp";
import "./references/parliament_period.tsp";
import "./references/electoral_data.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.CandidaciesMandates;

model AllQueryOptions {
	...EntityListQueryOptions;
	...ParliamentPeriodReferenceQueryOptions;
	...ElectoralDataReferenceQueryOptions;

	@query
	id_external_administration?: string;

	@query
	id_external_administration_description?: string;

	@query
	type?: CandidacyMandateType;

	@query
	start_date?: plainDate;

	@query
	end_date?: plainDate;

	@query
	info?: string;
}

alias Endpoints = EntityEndpoint<CandidacyMandate>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
