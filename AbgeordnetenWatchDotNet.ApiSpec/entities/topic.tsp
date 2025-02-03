import "./regularEntity.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model Topic extends RegularEntity {
	description: string;

	parent?: Reference<Topic>;
}
