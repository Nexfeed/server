FROM mcr.microsoft.com/dotnet/sdk:9.0 AS builder

WORKDIR nexfeed

COPY . ./

RUN dotnet restore
RUN dotnet publish -o out

FROM mcr.microsoft.com/dotnet/aspnet:9.0

WORKDIR nexfeed

COPY --from=builder /nexfeed/out .

EXPOSE 8080

ENTRYPOINT ["dotnet", "nexfeed.dll"]
