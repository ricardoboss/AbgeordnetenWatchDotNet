using AbgeordnetenWatchDotNet.Generated.Models;
using JetBrains.Annotations;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public class PaginationQueryBuilder<T>(RequestConfiguration<T> requestConfiguration)
	: BaseQueryBuilder<T>(requestConfiguration) where T : class, IPaginationQueryOptions, new()
{
	private readonly RequestConfiguration<T> requestConfiguration = requestConfiguration;

	public PaginationQueryBuilder<T> StartingAt(int value)
	{
		requestConfiguration.QueryParameters.RangeStart = value;

		return this;
	}

	public PaginationQueryBuilder<T> EndingAt(int value)
	{
		requestConfiguration.QueryParameters.RangeEnd = value;

		return this;
	}

	public PaginationQueryBuilder<T> WithPage(int value)
	{
		requestConfiguration.QueryParameters.Page = value;

		return this;
	}

	public PaginationQueryBuilder<T> WithPageSize(int value)
	{
		requestConfiguration.QueryParameters.PagerLimit = value;

		return this;
	}

	public PaginationQueryBuilder<T> ContinuedFrom(ResultMeta meta)
	{
		requestConfiguration.QueryParameters.RangeStart = meta.RangeStart + meta.Count;
		requestConfiguration.QueryParameters.RangeEnd = meta.RangeEnd;

		return this;
	}
}

[PublicAPI]
public static class PaginationQueryBuilderExtensions
{
	public static PaginationQueryBuilder<T> Pagination<T>(this RequestConfiguration<T> requestConfiguration)
		where T : class, IPaginationQueryOptions, new() => new(requestConfiguration);
}
