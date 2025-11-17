using AbgeordnetenWatchDotNet.Generated.Polls.Item;
using JetBrains.Annotations;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public class PollRelatedDataQueryBuilder(
	RequestConfiguration<PollsItemRequestBuilder.PollsItemRequestBuilderGetQueryParameters> requestConfiguration)
	: BaseQueryBuilder<PollsItemRequestBuilder.PollsItemRequestBuilderGetQueryParameters>(requestConfiguration)
{
	private readonly RequestConfiguration<PollsItemRequestBuilder.PollsItemRequestBuilderGetQueryParameters>
		requestConfiguration = requestConfiguration;

	public PollRelatedDataQueryBuilder IncludeVotes(bool include = true)
	{
		requestConfiguration.QueryParameters.RelatedData = include ? GetRelated_dataQueryParameterType.Votes : null;

		return this;
	}
}

[PublicAPI]
public static class PollRelatedDataQueryBuilderExtensions
{
	extension(RequestConfiguration<PollsItemRequestBuilder.PollsItemRequestBuilderGetQueryParameters>
		requestConfiguration)
	{
		public PollRelatedDataQueryBuilder RelatedData => new(requestConfiguration);
	}
}
