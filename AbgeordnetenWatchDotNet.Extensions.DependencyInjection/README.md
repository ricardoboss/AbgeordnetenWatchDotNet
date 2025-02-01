# Installation

```shell
dotnet add package AbgeordnetenWatchDotNet.Extensions.DependencyInjection
```

# Usage

```csharp
using AbgeordnetenWatchDotNet.Extensions.DependencyInjection;
using AbgeordnetenWatchDotNet.Generated;
using Microsoft.Extensions.DependencyInjection;

var services = new ServiceCollection();
services.AddAbgeordnetenWatchApiClient("my-http-client", httpClient =>
{
	httpClient.BaseAddress = new Uri("https://www.abgeordnetenwatch.de/api/v2/");
});

var serviceProvider = services.BuildServiceProvider();
var apiClient = serviceProvider.GetRequiredService<AbgeordnetenWatchApiClient>();
```

# License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/ricardoboss/AbgeordnetenWatchDotNet/blob/main/LICENSE.md) file for details.
