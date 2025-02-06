import "./regularEntity.tsp";
import "./parliament.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

alias ParliamentPeriodType = "election" | "legislature";

model ParliamentPeriod extends RegularEntity {
  @summary("Definiert das Parlament, zu dem diese Parlamentsperiode gehört")
  parliament: Reference<Parliament>;

  @summary("Die Parlamentsperiode, auf welche die Parlamentsperiode folgt. Im Moment wurde das Feld nur für Legislaturen gepflegt, um die vorherige Wahlperiode zu definieren")
  @encodedName("application/json", "previous_period")
  previousPeriod: Reference<ParliamentPeriod>;

  type: ParliamentPeriodType;

  @encodedName("application/json", "election_date")
  electionDate: plainDate;

  @encodedName("application/json", "start_date_period")
  startDatePeriod: plainDate;

  @encodedName("application/json", "end_date_period")
  endDatePeriod: plainDate;
}
