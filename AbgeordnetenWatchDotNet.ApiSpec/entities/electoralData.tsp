import "../framework/reference.tsp";
import "./electoralList.tsp";
import "./constituency.tsp";

namespace AbgeordnetenWatch;

model ElectoralData {
	@encodedName("application/json", "electoral_list")
	electoralList: Reference<ElectoralList>;

	@encodedName("application/json", "list_position")
	listPosition: integer;

	constituency: Reference<Constituency>;

	@encodedName("application/json", "constituency_result")
	constituencyResult: float;

	@encodedName("application/json", "constituency_result_count")
	constituencyResultCount: integer;

	@encodedName("application/json", "mandate_won")
	mandateWon: "constituency" | "list" | "moved_up";
}
