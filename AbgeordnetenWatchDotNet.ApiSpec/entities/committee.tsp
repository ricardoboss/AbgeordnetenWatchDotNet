import "./regularEntity.tsp";
import "./parliamentPeriod.tsp";
import "./topic.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Committee extends RegularEntity {
	@encodedName("application/json", "field_legislature")
	fieldLegislature: Reference<ParliamentPeriod>;

	@encodedName("application/json", "field_topics")
	fieldTopics: Reference<Topic>[];
}
