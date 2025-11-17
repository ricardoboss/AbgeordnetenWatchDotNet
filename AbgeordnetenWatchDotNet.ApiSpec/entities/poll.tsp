import "./regularEntity.tsp";
import "./committee.tsp";
import "./parliamentPeriod.tsp";
import "./topic.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Poll extends RegularEntity {
	entity_type: "poll";

	@encodedName("application/json", "field_committees")
	fieldCommittees: Reference<Committee>;

	@encodedName("application/json", "field_intro")
	fieldIntro: string;

	@encodedName("application/json", "field_legislature")
	fieldLegislature: Reference<ParliamentPeriod>;

	@encodedName("application/json", "field_poll_date")
	fieldPollDate: plainDate;

	@encodedName("application/json", "field_accepted")
	fieldAccepted: boolean;

	@encodedName("application/json", "field_related_links")
	fieldRelatedLinks: { uri: url; title: string; }[];

	@encodedName("application/json", "field_topics")
	fieldTopics: Reference<Topic>[];

	@encodedName("application/json", "related_data")
	relatedData?: PollsRelatedData;
}

model PollsRelatedData {
	votes?: Vote[];
}
