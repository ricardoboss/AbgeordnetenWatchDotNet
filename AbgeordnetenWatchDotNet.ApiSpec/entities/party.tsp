import "./regularEntity.tsp";

namespace AbgeordnetenWatch;

model Party extends RegularEntity {
	entity_type: "party";

	@encodedName("application/json", "full_name")
	fullName: string;

	@encodedName("application/json", "short_name")
	shortName: string;
}
