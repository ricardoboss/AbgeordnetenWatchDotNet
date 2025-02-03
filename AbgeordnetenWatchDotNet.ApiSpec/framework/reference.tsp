import "../entities/regularEntity.tsp";

namespace AbgeordnetenWatch;

model Reference<T extends RegularEntity> {
  ...RegularEntity;
}

model SubReference<T extends Entity> {
	...Entity;
  }
