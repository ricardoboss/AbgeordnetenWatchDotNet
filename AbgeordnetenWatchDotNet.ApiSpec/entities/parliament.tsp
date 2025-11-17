import "./regularEntity.tsp";
import "./parliamentPeriod.tsp";

namespace AbgeordnetenWatch;

model Parliament extends RegularEntity {
	entity_type: "parliament";

  @summary("Eine lange Bezeichnung für das Parlament, z.B. \"Abgeordnetenhaus von Berlin\"")
  @encodedName("application/json", "label_external_long")
  labelExternalLong: string;

  @encodedName("application/json", "current_project")
  currentProject: Reference<ParliamentPeriod>;
}
