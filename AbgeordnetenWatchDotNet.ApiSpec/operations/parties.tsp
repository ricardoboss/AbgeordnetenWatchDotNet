import "@typespec/http";

import "../entities/party.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Parties;

model AllQueryOptions {
	...LabelQueryOption;

	@query
	@encodedName("application/json", "full_name")
	fullName?: string;

	@query
	@encodedName("application/json", "short_name")
	shortName?: string;
}

alias Endpoints = EntityEndpoint<Party>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
