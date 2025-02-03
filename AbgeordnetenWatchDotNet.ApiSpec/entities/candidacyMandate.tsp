import "./entity.tsp";
import "./politician.tsp";
import "./party.tsp";
import "./parliamentPeriod.tsp";
import "./fractionMembership.tsp";
import "./electoralData.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model CandidacyMandate extends Entity {
	@encodedName("application/json", "id_external_administration")
	idExternalAdministration: string;

	@encodedName("application/json", "id_external_administration_description")
	idExternalAdministrationDescription: string;

	type: "candidacy" | "mandate";

	@encodedName("application/json", "parliament_period")
	parliamentPeriod: Reference<ParliamentPeriod>;

	politician: Reference<Politician>;

	party: Reference<Party>;

	@encodedName("application/json", "start_date")
	startDate: plainDate | null;

	@encodedName("application/json", "end_date")
	endDate: plainDate | null;

	info: string;

	@encodedName("application/json", "electoral_data")
	electoralData: ElectoralData;

	@encodedName("application/json", "fraction_membership")
	fractionMembership: FractionMembership[];
}
