import "./regularEntity.tsp";
import "./parliamentPeriod.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Constituency extends RegularEntity {
	name: string;

	number: integer;

	@encodedName("application/json", "parliament_period")
	parliamentPeriod: Reference<ParliamentPeriod>;
}
