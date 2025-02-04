import "@typespec/http";

using TypeSpec.Http;

namespace AbgeordnetenWatch;

model IdQueryOptions {
	@query
	id?: uint32;

	@query("id[gt]")
	idGreaterThan?: uint32;

	@query("id[gte]")
	idGreaterThanOrEqual?: uint32;

	@query("id[lt]")
	idLessThan?: uint32;

	@query("id[lte]")
	idLessThanOrEqual?: uint32;

	@query("id[ne]")
	idNotEqual?: uint32;

	@query("id[in]")
	idIn?: string;

	@query("id[notin]")
	idNotIn?: string;
}

model LabelQueryOption {
	@query
	label?: string;
}

model PaginationQueryOptions {
	@query("range_start")
	rangeStart?: uint32;

	@query("range_end")
	@maxValue(1000)
	rangeEnd?: uint32;

	@query
	page?: uint32;

	@query("pager_limit")
	@maxValue(1000)
	pagerLimit?: uint32;
}

model EntityListQueryOptions {
	...IdQueryOptions;
	...PaginationQueryOptions;
}

model RelatedDataQueryOption {
	@query("related_data")
	relatedData?: "show_information";
}
