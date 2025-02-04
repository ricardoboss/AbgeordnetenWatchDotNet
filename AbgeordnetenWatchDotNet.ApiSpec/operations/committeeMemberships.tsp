import "@typespec/http";

import "../entities/committeeMembership.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.CommitteeMemberships;

model AllQueryOptions {
	...EntityListQueryOptions;

	@query
	committee_role?: string;
}

alias Endpoints = EntityEndpoint<CommitteeMembership>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
