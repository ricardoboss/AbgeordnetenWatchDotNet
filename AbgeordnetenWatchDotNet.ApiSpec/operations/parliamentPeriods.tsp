import "@typespec/http";

import "../entities/parliamentPeriod.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.ParliamentPeriods;

model AllQueryOptions {
	...EntityListQueryOptions;

	@query
	type?: string;

	@query
	election_date?: plainDate;

	@query
	start_date_period?: plainDate;

	@query
	end_date_period?: plainDate;
}

alias Endpoints = EntityEndpoint<ParliamentPeriod>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
