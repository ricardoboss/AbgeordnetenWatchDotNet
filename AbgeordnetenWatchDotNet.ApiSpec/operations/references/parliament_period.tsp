import "@typespec/http";

import "../../entities/parliamentPeriod.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch;

model ParliamentPeriodReferenceQueryOptions {
	@query("parliament_period")
	parliamentPeriod?: uint32;

	@query("parliament_period[entity.type]")
	parliamentPeriodType?: ParliamentPeriodType;

	@query("parliament_period[entity.election_date]")
	parliamentPeriodElectionDate?: plainDate;

	@query("parliament_period[entity.election_date][gt]")
	parliamentPeriodElectionDateGreaterThan?: plainDate;

	@query("parliament_period[entity.election_date][gte]")
	parliamentPeriodElectionDateGreaterThanOrEqual?: plainDate;

	@query("parliament_period[entity.election_date][lt]")
	parliamentPeriodElectionDateLessThan?: plainDate;

	@query("parliament_period[entity.election_date][lte]")
	parliamentPeriodElectionDateLessThanOrEqual?: plainDate;

	@query("parliament_period[entity.start_date_period]")
	parliamentPeriodStartDatePeriod?: plainDate;

	@query("parliament_period[entity.start_date_period][gt]")
	parliamentPeriodStartDatePeriodGreaterThan?: plainDate;

	@query("parliament_period[entity.start_date_period][gte]")
	parliamentPeriodStartDatePeriodGreaterThanOrEqual?: plainDate;

	@query("parliament_period[entity.start_date_period][lt]")
	parliamentPeriodStartDatePeriodLessThan?: plainDate;

	@query("parliament_period[entity.start_date_period][lte]")
	parliamentPeriodStartDatePeriodLessThanOrEqual?: plainDate;

	@query("parliament_period[entity.end_date_period]")
	parliamentPeriodEndDatePeriod?: plainDate;

	@query("parliament_period[entity.end_date_period][gt]")
	parliamentPeriodEndDatePeriodGreaterThan?: plainDate;

	@query("parliament_period[entity.end_date_period][gte]")
	parliamentPeriodEndDatePeriodGreaterThanOrEqual?: plainDate;

	@query("parliament_period[entity.end_date_period][lt]")
	parliamentPeriodEndDatePeriodLessThan?: plainDate;

	@query("parliament_period[entity.end_date_period][lte]")
	parliamentPeriodEndDatePeriodLessThanOrEqual?: plainDate;

	// TODO: nested references
	@query("parliament_period[entity.parliament]")
	parliamentPeriodParliament?: uint32;

	@query("parliament_period[entity.previous_period]")
	parliamentPeriodPreviousPeriod?: uint32;
}
