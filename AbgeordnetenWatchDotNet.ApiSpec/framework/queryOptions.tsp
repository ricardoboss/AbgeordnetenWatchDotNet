import "@typespec/http";

using TypeSpec.Http;

namespace AbgeordnetenWatch;

model IdQueryOptions {
	@query
	id?: integer; // uint32;

	@query("id[gt]")
	idGreaterThan?: integer; // uint32;

	@query("id[gte]")
	idGreaterThanOrEqual?: integer; // uint32;

	@query("id[lt]")
	idLessThan?: integer; // uint32;

	@query("id[lte]")
	idLessThanOrEqual?: integer; // uint32;

	@query("id[ne]")
	idNotEqual?: integer; // uint32;

	@query("id[in]")
	idIn?: string;

	@query("id[notin]")
	idNotIn?: string;
}

model NumberQueryOptions {
	@query
	number?: integer; // uint32;

	@query("number[gt]")
	numberGreaterThan?: integer; // uint32;

	@query("number[gte]")
	numberGreaterThanOrEqual?: integer; // uint32;

	@query("number[lt]")
	numberLessThan?: integer; // uint32;

	@query("number[lte]")
	numberLessThanOrEqual?: integer; // uint32;

	@query("number[ne]")
	numberNotEqual?: integer; // uint32;

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

model DescriptionQueryOptions {
	@query
	description?: string;

	@query("description[sw]")
	descriptionStartsWith?: string;

	@query("description[cn]")
	descriptionContains?: string;

	@query("description[ew]")
	descriptionEndsWith?: string;

	@query("description[in]")
	descriptionIn?: string;

	@query("description[notin]")
	descriptionNotIn?: string;
}

model NameQueryOptions {
	@query
	name?: string;

	@query("name[sw]")
	nameStartsWith?: string;

	@query("name[cn]")
	nameContains?: string;

	@query("name[ew]")
	nameEndsWith?: string;

	@query("name[in]")
	nameIn?: string;

	@query("name[notin]")
	nameNotIn?: string;
}

model PaginationQueryOptions {
	@query
	range_start?: integer; // uint32;

	@query
	@maxValue(1000)
	range_end?: integer; // uint32;

	@query
	page?: integer; // uint32;

	@query
	@maxValue(1000)
	pager_limit?: integer; // uint32;
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
