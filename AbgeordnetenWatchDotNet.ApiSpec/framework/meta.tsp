namespace AbgeordnetenWatch;

model Meta {
	@encodedName("application/json", "abgeordnetenwatch_api")
	api: ApiMeta;

	status: Status;

	@encodedName("application/json", "status_message")
	statusMessage: string;

	result: PagedResultMeta | FullResultMeta;
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

alias ResultMeta = {
	count: integer;
	total: integer;
};

model PagedResultMeta {
	...ResultMeta;

	page: integer;

	@encodedName("application/json", "results_per_page")
	resultsPerPage: integer;
}

model FullResultMeta {
	...ResultMeta;

	@encodedName("application/json", "range_start")
	rangeStart: integer;

	@encodedName("application/json", "range_end")
	rangeEnd: integer;
}
