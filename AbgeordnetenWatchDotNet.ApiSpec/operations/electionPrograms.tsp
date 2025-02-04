import "@typespec/http";

import "../entities/electionProgram.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.ElectionPrograms;

model AllQueryOptions {
	...EntityListQueryOptions;
}

alias Endpoints = EntityEndpoint<ElectionProgram>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
