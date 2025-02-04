namespace AbgeordnetenWatchDotNet.QueryBuilder;

public interface IIdQueryOptions
{
	public int? Id { get; set; }

	public int? Idgt { get; set; }

	public int? Idgte { get; set; }

	public string? Idin { get; set; }

	public int? Idlt { get; set; }

	public int? Idlte { get; set; }

	public int? Idne { get; set; }

	public string? Idnotin { get; set; }
}
