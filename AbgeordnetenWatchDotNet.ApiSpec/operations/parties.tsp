import "@typespec/http";

import "../entities/party.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Parties;

model AllQueryOptions {
	...EntityListQueryOptions;
	...FullNameShortNameQueryOptions;
}

alias Endpoints = EntityEndpoint<Party>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get<RelatedDataQueryOption>;
