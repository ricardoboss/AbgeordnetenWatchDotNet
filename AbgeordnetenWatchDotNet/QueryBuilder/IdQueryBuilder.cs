using JetBrains.Annotations;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public class IdQueryBuilder<T>(RequestConfiguration<T> requestConfiguration) where T : class, IIdQueryOptions, new()
{
	public IdQueryBuilder<T> Between(int? min, int? max)
	{
		if (min is not null)
			requestConfiguration.QueryParameters.Idgte = min;

		if (max is not null)
			requestConfiguration.QueryParameters.Idlte = max;

		return this;
	}

	public IdQueryBuilder<T> Equals(int value)
	{
		requestConfiguration.QueryParameters.Id = value;

		return this;
	}

	public IdQueryBuilder<T> GreaterThan(int value)
	{
		requestConfiguration.QueryParameters.Idgt = value;

		return this;
	}

	public IdQueryBuilder<T> GreaterThanOrEquals(int value)
	{
		requestConfiguration.QueryParameters.Idgte = value;

		return this;
	}

	public IdQueryBuilder<T> LessThan(int value)
	{
		requestConfiguration.QueryParameters.Idlt = value;

		return this;
	}

	public IdQueryBuilder<T> LessThanOrEquals(int value)
	{
		requestConfiguration.QueryParameters.Idlte = value;

		return this;
	}

	public IdQueryBuilder<T> NotEquals(int value)
	{
		requestConfiguration.QueryParameters.Idne = value;

		return this;
	}

	public IdQueryBuilder<T> In(params int[] values)
	{
		requestConfiguration.QueryParameters.Idin = $"[{string.Join(",", values)}]";

		return this;
	}

	public IdQueryBuilder<T> NotIn(params int[] values)
	{
		requestConfiguration.QueryParameters.Idnotin = $"[{string.Join(",", values)}]";

		return this;
	}

	public RequestConfiguration<T> And() => requestConfiguration;
}

public static class IdQueryBuilderExtensions
{
	public static IdQueryBuilder<T> Id<T>(this RequestConfiguration<T> requestConfiguration)
		where T : class, IIdQueryOptions, new() => new(requestConfiguration);
}
