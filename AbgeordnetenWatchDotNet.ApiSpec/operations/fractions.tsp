import "@typespec/http";

import "../entities/fraction.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Fractions;

model AllQueryOptions {
	...LabelQueryOption;

	@query
	full_name?: string;

	@query
	short_name?: string;
}

alias Endpoints = EntityEndpoint<Fraction>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
