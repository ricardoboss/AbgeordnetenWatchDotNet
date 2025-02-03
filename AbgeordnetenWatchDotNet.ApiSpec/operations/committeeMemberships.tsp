import "@typespec/http";

import "../entities/committeeMembership.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.CommitteeMemberships;

model AllQueryOptions {
	...LabelQueryOption;

	@query
	@encodedName("application/json", "committee_role")
	committeeRole?: string;
}

alias Endpoints = EntityEndpoint<CommitteeMembership>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
