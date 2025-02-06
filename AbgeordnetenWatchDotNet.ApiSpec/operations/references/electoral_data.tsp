import "@typespec/http";

using TypeSpec.Http;

namespace AbgeordnetenWatch;

model ElectoralDataReferenceQueryOptions {
	@query("electoral_data[entity.list_position]")
	electoralDataListPosition?: uint32;

	// TODO: nested references
	@query("electoral_data[entity.constituency]")
	electoralDataConstituency?: uint32;
}
