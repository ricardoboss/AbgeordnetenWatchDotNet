namespace AbgeordnetenWatchDotNet;

public interface ICollectionResponse<T> : IResponse
{
	public List<T>? Data { get; set; }
}
