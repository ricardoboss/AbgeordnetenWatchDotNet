namespace AbgeordnetenWatch;

model Meta {
	@encodedName("application/json", "abgeordnetenwatch_api")
	api: ApiMeta;

	status: Status;

	@encodedName("application/json", "status_message")
	statusMessage: string;

	result: ResultMeta;
}

model ApiMeta {
	version: string;
	changelog: url;

	@encodedName("application/json", "licence")
	license: string;

	@encodedName("application/json", "licence_link")
	licenseUrl: url;

	documentation: url;
}

enum Status {
	ok,
	warning,
	error,
}

model ResultMeta {
	count: integer;
	total: integer;

	@pageIndex
	page?: integer;

	@pageSize
	@encodedName("application/json", "results_per_page")
	resultsPerPage?: integer;

	@offset
	@encodedName("application/json", "range_start")
	rangeStart?: integer;

	@encodedName("application/json", "range_end")
	rangeEnd?: integer;

	@encodedName("application/json", "entity_id")
	@encode(string)
	entityId?: integer;

	@encodedName("application/json", "entity_type")
	entityType?: string;
}
