import "@typespec/http";

import "../entities/topic.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Topics;

model AllQueryOptions {
	...EntityListQueryOptions;
	...DescriptionQueryOptions;
}

alias Endpoints = EntityEndpoint<Topic>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
