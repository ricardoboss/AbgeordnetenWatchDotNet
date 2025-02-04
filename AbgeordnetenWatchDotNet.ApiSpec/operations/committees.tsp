import "@typespec/http";

import "../entities/committee.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Committees;

model AllQueryOptions {
	...EntityListQueryOptions;
}

alias Endpoints = EntityEndpoint<Committee>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
