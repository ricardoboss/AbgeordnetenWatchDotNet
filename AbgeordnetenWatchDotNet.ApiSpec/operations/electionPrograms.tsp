import "@typespec/http";

import "../entities/electionProgram.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.ElectrionPrograms;

model AllQueryOptions {
	...LabelQueryOption;
	...EntityListQueryOptions;
}

alias Endpoints = EntityEndpoint<ElectionProgram>;
alias All = Endpoints.all<AllQueryOptions>;
alias Single = Endpoints.get;
