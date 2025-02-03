import "./fraction.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model FractionMembership {
	label: string;

	faction: Reference<Fraction>;

	@encodedName("application/json", "valid_from")
	validFrom: plainDate;

	@encodedName("application/json", "valid_until")
	validUntil: plainDate;
}
