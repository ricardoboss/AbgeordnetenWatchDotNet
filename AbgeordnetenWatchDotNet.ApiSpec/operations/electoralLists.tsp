import "@typespec/http";

import "../entities/electoralList.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.ElectoralLists;

model AllQueryOptions {
	...LabelQueryOption;

	@query
	name?: string;
}

alias Endpoints = EntityEndpoint<ElectoralList>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
