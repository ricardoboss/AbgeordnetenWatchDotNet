using JetBrains.Annotations;
using Microsoft.Kiota.Abstractions;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public class LabelQueryBuilder<T>(RequestConfiguration<T> requestConfiguration) : BaseQueryBuilder<T>(requestConfiguration)
	where T : class, ILabelQueryOptions, new()
{
	private readonly RequestConfiguration<T> requestConfiguration = requestConfiguration;

	public LabelQueryBuilder<T> IsExactly(string label)
	{
		requestConfiguration.QueryParameters.Label = label;

		return this;
	}

	public LabelQueryBuilder<T> Contains(string label)
	{
		requestConfiguration.QueryParameters.Labelcn = label;

		return this;
	}

	public LabelQueryBuilder<T> StartsWith(string prefix)
	{
		requestConfiguration.QueryParameters.Labelsw = prefix;

		return this;
	}

	public LabelQueryBuilder<T> EndsWith(string suffix)
	{
		requestConfiguration.QueryParameters.Labelew = suffix;

		return this;
	}

	public LabelQueryBuilder<T> In(params string[] labels)
	{
		requestConfiguration.QueryParameters.Labelin = FormatInListQueryValue(labels);

		return this;
	}

	public LabelQueryBuilder<T> NotIn(params string[] labels)
	{
		requestConfiguration.QueryParameters.Labelnotin = FormatInListQueryValue(labels);

		return this;
	}
}

[PublicAPI]
public static class LabelQueryBuilderExtensions
{
	extension<T>(RequestConfiguration<T> requestConfiguration) where T : class, ILabelQueryOptions, new()
	{
		public LabelQueryBuilder<T> Label => new(requestConfiguration);
	}
}
