import "@typespec/http";

import "../../entities/parliamentPeriod.tsp";

using TypeSpec.Http;

namespace AbgeordnetenWatch;

model CurrentProjectReferenceQueryOptions {
	@query("current_project")
	currentProject?: integer; // uint32;

	@query("current_project[entity.type]")
	currentProjectType?: ParliamentPeriodType;

	@query("current_project[entity.election_date]")
	currentProjectElectionDate?: plainDate;

	@query("current_project[entity.election_date][gt]")
	currentProjectElectionDateGreaterThan?: plainDate;

	@query("current_project[entity.election_date][gte]")
	currentProjectElectionDateGreaterThanOrEqual?: plainDate;

	@query("current_project[entity.election_date][lt]")
	currentProjectElectionDateLessThan?: plainDate;

	@query("current_project[entity.election_date][lte]")
	currentProjectElectionDateLessThanOrEqual?: plainDate;

	@query("current_project[entity.start_date_period]")
	currentProjectStartDatePeriod?: plainDate;

	@query("current_project[entity.start_date_period][gt]")
	currentProjectStartDatePeriodGreaterThan?: plainDate;

	@query("current_project[entity.start_date_period][gte]")
	currentProjectStartDatePeriodGreaterThanOrEqual?: plainDate;

	@query("current_project[entity.start_date_period][lt]")
	currentProjectStartDatePeriodLessThan?: plainDate;

	@query("current_project[entity.start_date_period][lte]")
	currentProjectStartDatePeriodLessThanOrEqual?: plainDate;

	@query("current_project[entity.end_date_period]")
	currentProjectEndDatePeriod?: plainDate;

	@query("current_project[entity.end_date_period][gt]")
	currentProjectEndDatePeriodGreaterThan?: plainDate;

	@query("current_project[entity.end_date_period][gte]")
	currentProjectEndDatePeriodGreaterThanOrEqual?: plainDate;

	@query("current_project[entity.end_date_period][lt]")
	currentProjectEndDatePeriodLessThan?: plainDate;

	@query("current_project[entity.end_date_period][lte]")
	currentProjectEndDatePeriodLessThanOrEqual?: plainDate;

	// TODO: nested references
	@query("current_project[entity.parliament]")
	currentProjectParliament?: integer; // uint32;

	@query("current_project[entity.previous_period]")
	currentProjectPreviousPeriod?: integer; // uint32;
}
