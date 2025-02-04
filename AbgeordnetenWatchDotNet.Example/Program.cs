using AbgeordnetenWatchDotNet.Extensions.Requests;
using AbgeordnetenWatchDotNet.Generated;
using AbgeordnetenWatchDotNet.Generated.Models;
using Microsoft.Kiota.Abstractions.Authentication;
using Microsoft.Kiota.Http.HttpClientLibrary;

var authenticationProvider = new AnonymousAuthenticationProvider();
var adapter = new HttpClientRequestAdapter(authenticationProvider);
var client = new AbgeordnetenWatchApiClient(adapter);

try
{
	var c = await client.Parliaments.GetAsync(r =>
	{
		r.WhereId().Between(1, 10);
	});

	foreach (var parliament in c!.Data!)
	{
		Console.WriteLine(parliament.LabelExternalLong);
	}
}
catch (ErrorResponse e)
{
	Console.Error.WriteLine("Error: " + e.Meta!.StatusMessage);
}
