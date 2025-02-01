using AbgeordnetenWatchDotNet.Generated;
using Microsoft.Kiota.Abstractions.Authentication;
using Microsoft.Kiota.Http.HttpClientLibrary;

var authenticationProvider = new AnonymousAuthenticationProvider();
var adapter = new HttpClientRequestAdapter(authenticationProvider);
var client = new AbgeordnetenWatchApiClient(adapter);

var result = await client.Parliaments.GetAsync();

foreach (var parliament in result?.Data ?? [])
{
	Console.WriteLine(parliament.Label);
}
