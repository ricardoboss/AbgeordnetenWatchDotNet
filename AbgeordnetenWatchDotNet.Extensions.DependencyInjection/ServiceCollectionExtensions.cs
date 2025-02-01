using AbgeordnetenWatchDotNet.Generated;
using JetBrains.Annotations;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Kiota.Abstractions;
using Microsoft.Kiota.Abstractions.Authentication;
using Microsoft.Kiota.Abstractions.Serialization;
using Microsoft.Kiota.Http.HttpClientLibrary;

namespace AbgeordnetenWatchDotNet.Extensions.DependencyInjection;

[PublicAPI]
public static class ServiceCollectionExtensions
{
	public static IServiceCollection AddAbgeordnetenWatchApiClient(this IServiceCollection services,
		string httpClientName, Action<HttpClient> configureHttpClient)
	{
		services.AddHttpClient(httpClientName, configureHttpClient);
		services.TryAddTransient<IAuthenticationProvider, AnonymousAuthenticationProvider>();
		services.TryAddTransient<IRequestAdapter>(sp =>
		{
			var authProvider = sp.GetRequiredService<IAuthenticationProvider>();
			var parseNodeFactory = sp.GetService<IParseNodeFactory>();
			var serializationWriterFactory = sp.GetService<ISerializationWriterFactory>();
			var httpClientFactory = sp.GetRequiredService<IHttpClientFactory>();
			var httpClient = httpClientFactory.CreateClient(httpClientName);

			return new HttpClientRequestAdapter(authProvider, parseNodeFactory, serializationWriterFactory, httpClient);
		});

		services.TryAddTransient<AbgeordnetenWatchApiClient>();

		return services;
	}
}
