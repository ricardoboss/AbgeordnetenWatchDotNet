import "./regularEntity.tsp";

namespace AbgeordnetenWatch;

model Party extends RegularEntity {
	@encodedName("application/json", "full_name")
	fullName: string;

	@encodedName("application/json", "short_name")
	shortName: string;
}
