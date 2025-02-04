using AbgeordnetenWatchDotNet.QueryBuilder;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.Extensions;

public static class ParliamentsRequestBuilder
{
	public static IdQueryBuilder<Generated.Parliaments.ParliamentsRequestBuilder.ParliamentsRequestBuilderGetQueryParameters> WhereId(
		this RequestConfiguration<Generated.Parliaments.ParliamentsRequestBuilder.ParliamentsRequestBuilderGetQueryParameters>
			requestConfiguration) => new(requestConfiguration);
}
