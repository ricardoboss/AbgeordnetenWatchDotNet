import "@typespec/http";

import "../entities/vote.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Votes;

model AllQueryOptions {
	...EntityListQueryOptions;

	@query
	vote?: VoteResult;

	@query
	reason_no_show?: NoShowReason;

	@query
	reason_no_show_other?: string;
}

alias Endpoints = EntityEndpoint<Vote>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
