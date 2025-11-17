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

	@query("election_date[gt]")
	election_dateGreaterThan?: plainDate;

	@query("election_date[gte]")
	election_dateGreaterThanOrEqual?: plainDate;

	@query("election_date[lt]")
	election_dateLessThan?: plainDate;

	@query("election_date[lte]")
	election_dateLessThanOrEqual?: plainDate;

	@query
	start_date_period?: plainDate;

	@query("start_date_period[gt]")
	start_date_periodGreaterThan?: plainDate;

	@query("start_date_period[gte]")
	start_date_periodGreaterThanOrEqual?: plainDate;

	@query("start_date_period[lt]")
	start_date_periodLessThan?: plainDate;

	@query("start_date_period[lte]")
	start_date_periodLessThanOrEqual?: plainDate;

	@query
	end_date_period?: plainDate;

	@query("end_date_period[gt]")
	end_date_periodGreaterThan?: plainDate;

	@query("end_date_period[gte]")
	end_date_periodGreaterThanOrEqual?: plainDate;

	@query("end_date_period[lt]")
	end_date_periodLessThan?: plainDate;

	@query("end_date_period[lte]")
	end_date_periodLessThanOrEqual?: plainDate;
}

alias Endpoints = EntityEndpoint<ParliamentPeriod>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
