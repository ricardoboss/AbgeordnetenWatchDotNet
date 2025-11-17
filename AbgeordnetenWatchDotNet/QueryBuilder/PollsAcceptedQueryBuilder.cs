using AbgeordnetenWatchDotNet.Generated.Polls;
using JetBrains.Annotations;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public class PollsAcceptedQueryBuilder(RequestConfiguration<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters> requestConfiguration) : BaseQueryBuilder<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters>(requestConfiguration)
{
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
	public static PollsAcceptedQueryBuilder PollOutcome(
		this RequestConfiguration<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters> requestConfiguration) =>
		new(requestConfiguration);
}
