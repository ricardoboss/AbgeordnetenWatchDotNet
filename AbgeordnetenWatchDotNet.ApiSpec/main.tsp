import "@typespec/openapi";
import "@typespec/http";

import "./operations/parliaments.tsp";
import "./operations/parliamentPeriods.tsp";
import "./operations/candidaciesMandates.tsp";
import "./operations/politicians.tsp";
import "./operations/committees.tsp";
import "./operations/committeeMemberships.tsp";
import "./operations/polls.tsp";
import "./operations/votes.tsp";
import "./operations/parties.tsp";
import "./operations/fractions.tsp";
import "./operations/electoralLists.tsp";
import "./operations/constituencies.tsp";
import "./operations/electionPrograms.tsp";

using TypeSpec.OpenAPI;
using TypeSpec.Http;

@service
@server("https://www.abgeordnetenwatch.de/api/v2/")
@info({
	title: "AbgeordnetenWatch API",
	version: "2.7",
	license: {
		name: "CC0 1.0",
		url: "https://creativecommons.org/publicdomain/zero/1.0/deed.de",
	},
})
@externalDocs("https://www.abgeordnetenwatch.de/api")
namespace AbgeordnetenWatch {
	@route("/parliaments")
	namespace Parliaments {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/parliament-periods")
	namespace ParliamentPeriods {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/candidacies-mandates")
	namespace CandidaciesMandates {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/politicians")
	namespace Politicians {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/committees")
	namespace Committees {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/committee-memberships")
	namespace CommitteeMemberships {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/polls")
	namespace Polls {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/votes")
	namespace Votes {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/parties")
	namespace Parties {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/fractions")
	namespace Fractions {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/electoral-lists")
	namespace ElectoralLists {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/constituencies")
	namespace Constituencies {
		op all is All;

		@route("/{id}")
		op single is Single;
	}

	@route("/election-program")
	namespace ElectrionPrograms {
		op all is All;

		@route("/{id}")
		op single is Single;
	}
}
