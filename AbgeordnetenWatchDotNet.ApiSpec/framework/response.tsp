import "./meta.tsp";
import "../entities/entity.tsp";

namespace AbgeordnetenWatch;

model ListResponse<T extends Entity> {
	meta: Meta;
	data: T[];
}

model EntityResponse<T extends Entity> {
	meta: Meta;
	data: T;
}
