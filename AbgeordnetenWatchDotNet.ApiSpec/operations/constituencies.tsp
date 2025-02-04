import "@typespec/http";

import "../entities/constituency.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Constituencies;

model AllQueryOptions {
	...LabelQueryOption;
	...EntityListQueryOptions;

	@query
	name?: string;

	@query
	number?: integer;
}

alias Endpoints = EntityEndpoint<Constituency>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
