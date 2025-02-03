import "@typespec/http";

import "../entities/poll.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Polls;

model AllQueryOptions {
	...LabelQueryOption;

	@query
	@encodedName("application/json", "field_accepted")
	fieldAccepted?: 1 | 0;
}

alias Endpoints = EntityEndpoint<Poll>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
