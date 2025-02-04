using AbgeordnetenWatchDotNet.Generated.Parliaments;
using AbgeordnetenWatchDotNet.QueryBuilder;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.Extensions.Requests;

public static class Parliaments
{
	public static IdQueryBuilder<ParliamentsRequestBuilder.ParliamentsRequestBuilderGetQueryParameters> WhereId(
		this RequestConfiguration<ParliamentsRequestBuilder.ParliamentsRequestBuilderGetQueryParameters>
			requestConfiguration) => new(requestConfiguration);
}
