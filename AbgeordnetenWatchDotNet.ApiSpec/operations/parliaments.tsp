import "@typespec/http";

import "../entities/parliament.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";
import "./references/current_project.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Parliaments;

model AllQueryOptions {
	...EntityListQueryOptions;
	...CurrentProjectReferenceQueryOptions;

	@query
	label_external_long?: string;

	@query("label_external_long[sw]")
	label_external_longStartsWith?: string;

	@query("label_external_long[cn]")
	label_external_longContains?: string;

	@query("label_external_long[ew]")
	label_external_longEndsWith?: string;

	@query("label_external_long[in]")
	label_external_longIn?: string;

	@query("label_external_long[notin]")
	label_external_longNotIn?: string;
}


alias Endpoints = EntityEndpoint<Parliament>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
