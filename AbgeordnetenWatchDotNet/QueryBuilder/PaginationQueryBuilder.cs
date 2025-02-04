using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

public class PaginationQueryBuilder<T>(RequestConfiguration<T> requestConfiguration) where T : class, IPaginationQueryOptions, new()
{
	public PaginationQueryBuilder<T> StartingAt(int value)
	{
		requestConfiguration.QueryParameters.RangeStart = value;

		return this;
	}

	public PaginationQueryBuilder<T> WithPageSize(int value)
	{
		requestConfiguration.QueryParameters.RangeEnd = value;

		return this;
	}

	public PaginationQueryBuilder<T> Page(int value)
	{
		requestConfiguration.QueryParameters.Page = value;

		return this;
	}

	public PaginationQueryBuilder<T> PagerLimit(int value)
	{
		requestConfiguration.QueryParameters.PagerLimit = value;

		return this;
	}

	public RequestConfiguration<T> And() => requestConfiguration;
}

public static class PaginationQueryBuilderExtensions
{
	public static PaginationQueryBuilder<T> Pagination<T>(this RequestConfiguration<T> requestConfiguration)
		where T : class, IPaginationQueryOptions, new() => new(requestConfiguration);
}
