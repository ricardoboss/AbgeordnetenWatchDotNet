import "@typespec/http";

using TypeSpec.Http;

namespace AbgeordnetenWatch;

model IdQueryOptions {
	@query
	id?: uint32;

	@query
	@encodedName("application/x-www-form-urlencoded", "id[gt]")
	idGreaterThan?: uint32;

	@query
	@encodedName("application/x-www-form-urlencoded", "id[gte]")
	idGreaterThanOrEqual?: uint32;

	@query
	@encodedName("application/x-www-form-urlencoded", "id[lt]")
	idLessThan?: uint32;

	@query
	@encodedName("application/x-www-form-urlencoded", "id[lte]")
	idLessThanOrEqual?: uint32;

	@query
	@encodedName("application/x-www-form-urlencoded", "id[ne]")
	idNotEqual?: uint32;

	@query
	@encodedName("application/x-www-form-urlencoded", "id[in]")
	idIn?: uint32[];

	@query
	@encodedName("application/x-www-form-urlencoded", "id[notin]")
	idNotIn?: uint32[];
}

model LabelQueryOption {
	@query
	label?: string;
}

model PaginationQueryOptions {
	@query
	@encodedName("application/x-www-form-urlencoded", "range_start")
	rangeStart?: uint32;

	@query
	@encodedName("application/x-www-form-urlencoded", "range_end")
	@maxValue(1000)
	rangeEnd?: uint32;

	@query
	page?: uint32;

	@query
	@encodedName("application/json", "pager_limit")
	@maxValue(1000)
	pagerLimit?: uint32;
}

model EntityListQueryOptions {
	...IdQueryOptions;
	...PaginationQueryOptions;
}

model RelatedDataQueryOption {
	@query
	@encodedName("application/json", "related_data")
	relatedData?: "show_information";
}
