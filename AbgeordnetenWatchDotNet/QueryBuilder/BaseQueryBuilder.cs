using JetBrains.Annotations;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public abstract class BaseQueryBuilder<T>(RequestConfiguration<T> requestConfiguration) where T : class, new()
{
	public RequestConfiguration<T> And() => requestConfiguration;

	protected static string FormatInListQueryValue<TValue>(TValue[] values)
	{
		return $"[{string.Join(",", values)}]";
	}
}
