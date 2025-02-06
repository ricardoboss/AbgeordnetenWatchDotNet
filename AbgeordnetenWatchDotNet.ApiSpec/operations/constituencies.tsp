import "@typespec/http";

import "../entities/constituency.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";
import "./references/parliament_period.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Constituencies;

model AllQueryOptions {
	...EntityListQueryOptions;
	...NameQueryOptions;
	...NumberQueryOptions;
	...ParliamentPeriodReferenceQueryOptions;
}

alias Endpoints = EntityEndpoint<Constituency>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
