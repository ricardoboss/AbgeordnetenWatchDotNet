import "./regularEntity.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Topic extends RegularEntity {
	entity_type: "topic";

	description: string;

	parent?: Reference<Topic>;
}
