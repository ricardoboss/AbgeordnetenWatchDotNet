import "@typespec/http";

using TypeSpec.Http;

namespace AbgeordnetenWatch;

model RelatedDataQueryOption {
	@query
	@encodedName("application/json", "related_data")
	relatedData?: "show_information";
}

model LabelQueryOption {
	@query
	label?: string;
}
