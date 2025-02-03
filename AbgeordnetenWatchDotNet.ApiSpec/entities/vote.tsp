import "./entity.tsp";
import "./candidacyMandate.tsp";
import "./fraction.tsp";
import "./poll.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Vote extends Entity {
	mandate: SubReference<CandidacyMandate>;
	fraction: Reference<Fraction>;
	poll: Reference<Poll>;
	vote: VoteResult;

	@encodedName("application/json", "reason_no_show")
	reasonNoShow: NoShowReason | null;

	@encodedName("application/json", "reason_no_show_other")
	reasonNoShowOther: string | null;
}

alias VoteResult = "yes" | "no" | "no_show";
alias NoShowReason = "maternity_protection" | "fell_ill" | "other";
