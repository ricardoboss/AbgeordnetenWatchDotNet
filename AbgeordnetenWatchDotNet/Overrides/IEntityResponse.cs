namespace AbgeordnetenWatchDotNet;

public interface IEntityResponse<T> : IResponse
{
	public T? Data { get; set; }
}
