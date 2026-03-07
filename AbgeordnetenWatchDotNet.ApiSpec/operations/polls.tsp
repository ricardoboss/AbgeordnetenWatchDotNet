import "@typespec/http";

import "../entities/poll.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Polls;

model AllQueryOptions {
	...EntityListQueryOptions;

	@query
	field_accepted?: 1 | 0;

	@query
	field_intro?: string;

	@query("field_intro[sw]")
	field_introStartsWith?: string;

	@query("field_intro[cn]")
	field_introContains?: string;

	@query("field_intro[ew]")
	field_introEndsWith?: string;

	@query("field_intro[in]")
	field_introIn?: string;

	@query("field_intro[notin]")
	field_introNotIn?: string;

	@query
	field_poll_date?: plainDate;

	@query("field_poll_date[gt]")
	field_poll_dateGreaterThan?: plainDate;

	@query("field_poll_date[gte]")
	field_poll_dateGreaterThanOrEqual?: plainDate;

	@query("field_poll_date[lt]")
	field_poll_dateLessThan?: plainDate;

	@query("field_poll_date[lte]")
	field_poll_dateLessThanOrEqual?: plainDate;

	@query
	field_committees?: integer;
	// TODO: filter by field_committees (ref -> committee)

	@query
	field_legislature?: integer;
	// TODO: filter by field_legislature (ref -> parliamentPeriod)

	@query
	field_topics?: integer;
	// TODO: filter by field_topics (ref -> topic)
}

model PollsRelatedDataQueryOptions {
	@query
	related_data?: "show_information" | "votes";
}

alias Endpoints = EntityEndpoint<Poll>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<PollsRelatedDataQueryOptions>;
