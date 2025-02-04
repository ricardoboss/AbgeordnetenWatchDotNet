using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

public class IdQueryBuilder<T>(RequestConfiguration<T> requestConfiguration) where T : class, IIdQueryOptions, new()
{
	public void Between(int? min = null, int? max = null)
	{
		if (min is not null)
			requestConfiguration.QueryParameters.Idgte = min;

		if (max is not null)
			requestConfiguration.QueryParameters.Idlte = max;
	}

	public void Equals(int value) => requestConfiguration.QueryParameters.Id = value;

	public void GreaterThan(int value) => requestConfiguration.QueryParameters.Idgt = value;

	public void GreaterThanOrEquals(int value) => requestConfiguration.QueryParameters.Idgte = value;

	public void LessThan(int value) => requestConfiguration.QueryParameters.Idlt = value;

	public void LessThanOrEquals(int value) => requestConfiguration.QueryParameters.Idlte = value;

	public void NotEquals(int value) => requestConfiguration.QueryParameters.Idne = value;

	public void In(params int[] values) => requestConfiguration.QueryParameters.Idin = $"[{string.Join(",", values)}]";

	public void NotIn(params int[] values) => requestConfiguration.QueryParameters.Idnotin = $"[{string.Join(",", values)}]";
}
