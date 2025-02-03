import "@typespec/http";

import "../entities/electionProgram.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.ElectrionPrograms;

alias Endpoints = EntityEndpoint<ElectionProgram>;
alias All = Endpoints.all<LabelQueryOption>;
alias Single = Endpoints.get;
