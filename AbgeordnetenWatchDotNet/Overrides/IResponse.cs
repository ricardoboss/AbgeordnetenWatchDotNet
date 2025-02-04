using AbgeordnetenWatchDotNet.Generated.Models;

namespace AbgeordnetenWatchDotNet;

public interface IResponse
{
	public Meta? Meta { get; set; }
}

public interface IEntityResponse<T> : IResponse
{
	public T? Data { get; set; }
}

public interface ICollectionResponse<T> : IResponse
{
	public List<T>? Data { get; set; }
}
