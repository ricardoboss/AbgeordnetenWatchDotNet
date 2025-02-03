import "./regularEntity.tsp";
import "./committee.tsp";
import "./candidacyMandate.tsp";
import "./committeeRole.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model CommitteeMembership extends RegularEntity {
	committee: Reference<Committee>;

	@encodedName("application/json", "candidacy_mandate")
	candidacyMandate: SubReference<CandidacyMandate>;

	@encodedName("application/json", "committee_role")
	committeeRole: CommitteeRole;
}
