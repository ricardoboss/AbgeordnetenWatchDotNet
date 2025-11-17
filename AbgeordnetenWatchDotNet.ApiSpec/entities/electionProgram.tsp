import "./entity.tsp";
import "./parliamentPeriod.tsp";
import "./party.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model ElectionProgram extends Entity {
	entity_type: "election_program";

	@encodedName("application/json", "parliament_period")
	parliamentPeriod: Reference<ParliamentPeriod>;

	party: Reference<Party>;

	link: DocumentLink[];

	file: url;
}

model DocumentLink {
	uri: url;
	title: string;
}
