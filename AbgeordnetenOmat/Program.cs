using AbgeordnetenWatchApi.Generated;
using Microsoft.Kiota.Abstractions.Authentication;
using Microsoft.Kiota.Http.HttpClientLibrary;

// ReSharper disable UnusedVariable
#pragma warning disable CS8321 // Local function is declared but never used

var authProvider = new AnonymousAuthenticationProvider();
var httpClient = new HttpClient();
httpClient.BaseAddress = new("https://www.abgeordnetenwatch.de/api/v2");
var adapter = new HttpClientRequestAdapter(authProvider, httpClient: httpClient);
var client = new AbgeordnetenWatchApiClient(adapter);

// await GetParliaments(client);

return;

static async Task GetParliaments(AbgeordnetenWatchApiClient client)
{
	var parliaments = await client.Parliaments.GetAsync();
	if (parliaments is { Data: { } data, Meta: { } meta })
	{
		Console.WriteLine($"Found {data.Count} parliaments:");
		foreach (var parliament in data)
		{
			Console.WriteLine($"- {parliament.LabelExternalLong}");
		}
	}
}
