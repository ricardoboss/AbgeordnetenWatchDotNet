import "@typespec/http";

import "../entities/vote.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Votes;

model AllQueryOptions {
	...IdQueryOptions;
	...PaginationQueryOptions;

	@query
	vote?: VoteResult;

	@query("vote[sw]")
	voteStartsWith?: string;

	@query("vote[cn]")
	voteContains?: string;

	@query("vote[ew]")
	voteEndsWith?: string;

	@query("vote[in]")
	voteIn?: string;

	@query("vote[notin]")
	voteNotIn?: string;

	@query
	reason_no_show?: NoShowReason;

	@query("reason_no_show[sw]")
	reason_no_showStartsWith?: string;

	@query("reason_no_show[cn]")
	reason_no_showContains?: string;

	@query("reason_no_show[ew]")
	reason_no_showEndsWith?: string;

	@query("reason_no_show[in]")
	reason_no_showIn?: string;

	@query("reason_no_show[notin]")
	reason_no_showNotIn?: string;

	@query
	reason_no_show_other?: string;

	@query("reason_no_show_other[sw]")
	reason_no_show_otherStartsWith?: string;

	@query("reason_no_show_other[cn]")
	reason_no_show_otherContains?: string;

	@query("reason_no_show_other[ew]")
	reason_no_show_otherEndsWith?: string;

	@query("reason_no_show_other[in]")
	reason_no_show_otherIn?: string;

	@query("reason_no_show_other[notin]")
	reason_no_show_otherNotIn?: string;

	@query
	mandate?: integer;
	// TODO: filter by mandate (ref -> candidacyMandate)

	@query
	fraction?: integer;
	// TODO: filter by fraction (ref -> fraction)

	@query
	poll?: integer;
	// TODO: filter by poll (ref -> poll)
}

alias Endpoints = EntityEndpoint<Vote>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
