# Setup

Before diving into coding an applicaiton built with Angular 4 and .NET there are some prequisites which must be satisfied. This process is based upon instructions originally authored by [@ciel](https://www.github.com/ciel) and has been modified for use with the Yarn package manager by [@LilyBell](https://www.github.com/LilyBell).

### Prequisites
* [Windows 10](https://www.microsoft.com/en-us/software-download/windows10)
* [.NET Core](https://www.microsoft.com/net/core#windowscmd)
* [Chocolatey Package Manager](https://chocolatey.org/)

In order to make use of the Yarn package manager complete the following steps:
## Step 1: Install [Yarn](https://yarnpkg.com)

```
choco install yarn
```

## Step 2: Install [Angular 4](https://angular.io)

```
yarn global add @angular/cli
```

## Step 3: Set Yarn as default package manager

```
ng set --global packageManager=yarn
```


## Step 4: Install [rimraf](https://github.com/isaacs/rimraf)

rimraf is a package that emulates the Linux command rm -rf to avoid errors in Windows associated with deletion of non empty directories.

```
yarn global add rimraf
```

## Step 5: Install [Typescript](https://www.typescriptlang.org/)

```
yarn global add typescript
```

## Step 6: Clone [git repo](https://www.github.com/LilyBell/angular_dotnet_startup).
Please include the trailing '.' as this instructs git to clone into the current directory rather than create a new directory.

```
git clone --depth=1 https://github.com/LilyBell/angular_dotnet_startup.git .
```

## Step 7: Delete the git repository and install modules

```
rimraf .git
yarn install
```

## Step 8: Create root directories
These directories are for source code, tooling and IDE specifics

```
mkdir src
mkdir .vscode
mkdir .nuget
mkdir .blueprints
```

## Step 9: Create new .NET solution
Note that the solution is being named ```.``` and being given an output of ```.``` This is done to keep the names generic and fit with the pattern of other agnostic files like ```.gitignore``` and ```.jsbeautify.``` This is not a requirement.

```
dotnet new sln -n . -o .
```

## Step 10: Correct solution filename
Because of the way the ```dotnet-cli``` creates the solution file, it gets made with a filename of ```..sln```, so we use the ```mv``` command to fix it.

```
mv ..sln .sln
```

## Step 11: Create a new .NET Core class library

```
dotnet new classlib -n common -o ./src/common
```

## Step 12: Create a new .NET Core ASP.NET project
This is the actual application that will run the .NET(C#) backend and the Angular 4(JavaScript) frontend.

```
dotnet new mvc -n client -o ./src/client
```

## Step 13: Add each of the projects to the previously created solution
This assures that ```dotnet-cli``` knows how to treat the attached projects.

```
dotnet sln . add ./src/common/common.csproj
dotnet sln . add ./src/client/client.csproj
```

## Step 14: Remove all default views and controllers (Optional)
The purpose of this is to create a barebones application and to flush the wwwroot folder where the Angular frontend will reside.

```
mv ./src/client/appsettings.Development.json ./src/client/appsettings.dev.json
rimraf ./src/client/wwwroot
rimraf ./src/client/controllers
rimraf ./src/client/models
rimraf ./src/client/views
rimraf ./src/client/.bowerrc
rimraf ./src/client/bower.json
rimraf ./src/client/bundleconfig.json
```

## Step 15: Views and Controllers
The built in views and controllers don't work well for an Angular application. Some that work with it are supplied and need to be moved into the correct directory.

```
mv ./templates/Views ./src/client
mv ./templates/Controllers ./src/client
rimraf ./templates
```

## Step 16: Angular
Navigate to the directory where you want to create your Angular frontend.

```
cd ./src/client
```

Create the Angular application in the ```./src/client/wwwroot``` folder. 

```
ng new wwwroot
```

Navigate into the Angular project

```
cd wwwroot
```

Build the Angular project

```
ngbuild
```

## Step 17: Run
Finally the project can be run

```
cd ..
dotnet restore
dotnet run
```

