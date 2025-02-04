namespace AbgeordnetenWatchDotNet.QueryBuilder;

public interface IPaginationQueryOptions
{
	public int? RangeStart { get; set; }

	public int? RangeEnd { get; set; }

	public int? Page { get; set; }

	public int? PagerLimit { get; set; }
}
