# Installation

```shell
dotnet add package AbgeordnetenWatchDotNet
```

# Usage

```csharp
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
```

# License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/ricardoboss/AbgeordnetenWatchDotNet/blob/main/LICENSE.md) file for details.
