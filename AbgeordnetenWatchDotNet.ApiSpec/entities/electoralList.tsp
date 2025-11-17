import "./regularEntity.tsp";
import "./parliamentPeriod.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model ElectoralList extends RegularEntity {
	entity_type: "electoral_list";

	name: string;

	@encodedName("application/json", "parliament_period")
	parliamentPeriod: Reference<ParliamentPeriod>;
}
