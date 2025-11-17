import "@typespec/http";

import "../entities/committeeMembership.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.CommitteeMemberships;

model AllQueryOptions {
	...EntityListQueryOptions;

	@query
	committee_role?: CommitteeRole;

	@query("committee_role[sw]")
	committee_roleStartsWith?: string;

	@query("committee_role[cn]")
	committee_roleContains?: string;

	@query("committee_role[ew]")
	committee_roleEndsWith?: string;

	@query("committee_role[in]")
	committee_roleIn?: string;

	@query("committee_role[notin]")
	committee_roleNotIn?: string;
}

alias Endpoints = EntityEndpoint<CommitteeMembership>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
