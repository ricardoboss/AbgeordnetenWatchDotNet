import "@typespec/http";

import "../entities/fraction.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Fractions;

model AllQueryOptions {
	...EntityListQueryOptions;
	...FullNameShortNameQueryOptions;
}

alias Endpoints = EntityEndpoint<Fraction>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
