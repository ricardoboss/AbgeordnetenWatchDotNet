import "@typespec/http";

import "../entities/parliamentPeriod.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.ParliamentPeriods;

model AllQueryOptions {
	@query
	label?: string;

	@query
	type?: string;

	@query
	@encodedName("application/json", "election_date")
	electionDate?: plainDate;

	@query
	@encodedName("application/json", "start_date_period")
	startDatePeriod?: plainDate;

	@query
	@encodedName("application/json", "end_date_period")
	endDatePeriod?: plainDate;
}

alias Endpoints = EntityEndpoint<ParliamentPeriod>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
