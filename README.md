![NuGet Downloads](https://img.shields.io/nuget/dt/AbgeordnetenWatchDotNet)
![NuGet Version](https://img.shields.io/nuget/v/AbgeordnetenWatchDotNet)
![GitHub commits since latest release](https://img.shields.io/github/commits-since/ricardoboss/AbgeordnetenWatchDotNet/latest)

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

# Development

## Setup

- You need to have [.NET 10 or later](https://dotnet.microsoft.com/en-us/download) installed
- You need to have [corepack](https://yarnpkg.com/corepack) enabled
  - This also requires [Node 16.9 or later](https://nodejs.org/en/download)

## Code generation

This project relies heavily on code generation.

### API Spec

Since the API spec is not available as an OpenAPI specification, we generate our own using
[typespec](https://typespec.io).

The spec is generated using MSBuild and the typespec compiler in the
[`AbgeordnetenWatchDotNet.ApiSpec`](./AbgeordnetenWatchDotNet.ApiSpec) project.
Building it causes the spec to get generated.

### API Client

The actual API client is also generated using [kiota](https://aka.ms/kiota).
It consumes the [API Spec](#api-spec) to generate a C# API client that is fully type-safe.

### Watch

To make developing this library as easy as possible, the whole toolchain supports using `dotnet watch`.

This means using

```shell
dotnet watch --project ./AbgeordnetenWatchDotNet.Example/AbgeordnetenWatchDotNet.Example.csproj -- build
```

you can work on any of the files (including the .tsp-files) and changes cause the spec and the API client to get
updated.

You can also run `dotnet watch` in any of the project directories.
