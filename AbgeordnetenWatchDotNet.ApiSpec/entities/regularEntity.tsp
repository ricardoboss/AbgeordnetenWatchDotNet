import "./entity.tsp";

namespace AbgeordnetenWatch;

model RegularEntity extends Entity {
  @summary("Die URL zur Detailansicht für diese Entität auf abgeordnetenwatch.de")
  @encodedName("application/json", "abgeordnetenwatch_url")
  abgeordnetenwatchUrl: url;
}
