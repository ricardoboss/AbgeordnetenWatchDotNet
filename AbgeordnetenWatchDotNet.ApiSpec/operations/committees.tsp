import "@typespec/http";

import "../entities/committee.tsp";
import "../framework/entityEndpoint.tsp";
import "../framework/queryOptions.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch.Committees;

alias Endpoints = EntityEndpoint<Committee>;
alias All = Endpoints.all<LabelQueryOption>;
alias Single = Endpoints.get;
