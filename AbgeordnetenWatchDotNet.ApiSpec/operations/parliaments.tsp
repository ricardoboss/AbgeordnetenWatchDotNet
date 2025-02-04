import "@typespec/http";

import "../entities/parliament.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Parliaments;

model AllQueryOptions {
	...EntityListQueryOptions;

	@query
	label_external_long?: string;
}


alias Endpoints = EntityEndpoint<Parliament>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
