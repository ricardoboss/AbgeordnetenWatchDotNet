import "./regularEntity.tsp";
import "./parliamentPeriod.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Fraction extends RegularEntity {
	@encodedName("application/json", "full_name")
	fullName: string;

	@encodedName("application/json", "short_name")
	shortName: string;

	legislature: Reference<ParliamentPeriod>;
}
