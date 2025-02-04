import "@typespec/http";

import "../entities/country.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Countries;

model AllQueryOptions {
	...EntityListQueryOptions;
}

alias Endpoints = EntityEndpoint<Country>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
