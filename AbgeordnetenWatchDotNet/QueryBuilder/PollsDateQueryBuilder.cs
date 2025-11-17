using AbgeordnetenWatchDotNet.Generated.Polls;
using JetBrains.Annotations;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public class PollsDateQueryBuilder(
	RequestConfiguration<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters> requestConfiguration)
	: BaseQueryBuilder<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters>(requestConfiguration)
{
	private readonly RequestConfiguration<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters> requestConfiguration = requestConfiguration;

	public PollsDateQueryBuilder Exactly(DateOnly date)
	{
		requestConfiguration.QueryParameters.FieldPollDate = date;

		return this;
	}

	public PollsDateQueryBuilder After(DateOnly date)
	{
		requestConfiguration.QueryParameters.FieldPollDategt = date;

		return this;
	}

	public PollsDateQueryBuilder OnOrAfter(DateOnly date)
	{
		requestConfiguration.QueryParameters.FieldPollDategte = date;

		return this;
	}

	public PollsDateQueryBuilder Before(DateOnly date)
	{
		requestConfiguration.QueryParameters.FieldPollDatelt = date;

		return this;
	}

	public PollsDateQueryBuilder OnOrBefore(DateOnly date)
	{
		requestConfiguration.QueryParameters.FieldPollDatelte = date;

		return this;
	}
}

[PublicAPI]
public static class PollsDateQueryBuilderExtensions
{
	public static PollsDateQueryBuilder PollDate(
		this RequestConfiguration<PollsRequestBuilder.PollsRequestBuilderGetQueryParameters> requestConfiguration) =>
		new(requestConfiguration);
}
