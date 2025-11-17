using AbgeordnetenWatchDotNet.Generated.Polls;
using JetBrains.Annotations;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public class PollsAcceptedQueryBuilder(
	RequestConfiguration<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters> requestConfiguration)
	: BaseQueryBuilder<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters>(requestConfiguration)
{
	private readonly RequestConfiguration<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters>
		requestConfiguration = requestConfiguration;

	public PollsAcceptedQueryBuilder OnlyDenied()
	{
		requestConfiguration.QueryParameters.FieldAccepted = 0;

		return this;
	}

	public PollsAcceptedQueryBuilder OnlyAccepted()
	{
		requestConfiguration.QueryParameters.FieldAccepted = 1;

		return this;
	}

	public PollsAcceptedQueryBuilder Any()
	{
		requestConfiguration.QueryParameters.FieldAccepted = null;

		return this;
	}
}

[PublicAPI]
public static class PollsAcceptedQueryBuilderExtensions
{
	extension(RequestConfiguration<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters> requestConfiguration)
	{
		public PollsAcceptedQueryBuilder PollOutcome => new(requestConfiguration);
	}
}
