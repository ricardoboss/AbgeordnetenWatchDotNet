import "@typespec/http";

import "../entities/city.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Cities;

model AllQueryOptions {
	...EntityListQueryOptions;
}

alias Endpoints = EntityEndpoint<City>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
