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

model NumberQueryOptions {
	@query
	number?: uint32;

	@query("number[gt]")
	numberGreaterThan?: uint32;

	@query("number[gte]")
	numberGreaterThanOrEqual?: uint32;

	@query("number[lt]")
	numberLessThan?: uint32;

	@query("number[lte]")
	numberLessThanOrEqual?: uint32;

	@query("number[ne]")
	numberNotEqual?: uint32;

	@query("number[in]")
	numberIn?: string;

	@query("number[notin]")
	numberNotIn?: string;
}

model LabelQueryOptions {
	@query
	label?: string;

	@query("label[sw]")
	labelStartsWith?: string;

	@query("label[cn]")
	labelContains?: string;

	@query("label[ew]")
	labelEndsWith?: string;

	@query("label[in]")
	labelIn?: string;

	@query("label[notin]")
	labelNotIn?: string;
}

model PaginationQueryOptions {
	@query
	range_start?: uint32;

	@query
	@maxValue(1000)
	range_end?: uint32;

	@query
	page?: uint32;

	@query
	@maxValue(1000)
	pager_limit?: uint32;
}

model EntityListQueryOptions {
	...IdQueryOptions;
	...LabelQueryOptions;
	...PaginationQueryOptions;
}

model RelatedDataQueryOption {
	@query
	related_data?: "show_information";
}
