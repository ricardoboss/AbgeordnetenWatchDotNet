using AbgeordnetenWatchDotNet.Extensions.DependencyInjection;
using AbgeordnetenWatchDotNet.Generated;
using AbgeordnetenWatchDotNet.Generated.Models;
using AbgeordnetenWatchDotNet.QueryBuilder;
using Microsoft.Extensions.DependencyInjection;

var services = new ServiceCollection();
services.AddAbgeordnetenWatchApiClient();

var serviceProvider = services.BuildServiceProvider();
var client = serviceProvider.GetRequiredService<AbgeordnetenWatchApiClient>();

try
{
	// var c = await client.Parliaments.GetAsync(r =>
	// {
	// 	r.Id().LessThan(3).And().Pagination().StartingAt(1);
	// });
	//
	// foreach (var parliament in c!.Data!)
	// {
	// 	Console.WriteLine(parliament.LabelExternalLong);
	// }
}
catch (ErrorResponse e)
{
	Console.Error.WriteLine("Error: " + e.Meta!.StatusMessage);
}
