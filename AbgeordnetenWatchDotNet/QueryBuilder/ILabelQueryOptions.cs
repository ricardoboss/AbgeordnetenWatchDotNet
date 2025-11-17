using JetBrains.Annotations;

namespace AbgeordnetenWatchDotNet.QueryBuilder;

[PublicAPI]
public interface ILabelQueryOptions
{
	string? Label { get; set; }

	string? Labelcn { get; set; }

	string? Labelew { get; set; }

	string? Labelin { get; set; }

	string? Labelnotin { get; set; }

	string? Labelsw { get; set; }
}
