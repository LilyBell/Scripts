Write-Host "Welcome to the Angular .NET Core application automated process by @LilyBell https://www.github.com/LilyBell"
Write-Host "Manual instructions for this process can be found at https://github.com/LilyBell/angular_dotnet_startup/blob/master/readme.md"
$ProjectName = Read-Host -Prompt 'Input the name of the project to be created'
$Invocation = Get-Location
$DirectoryPath = $Invocation.Path
New-Item -Path $DirectoryPath -Name $ProjectName -ItemType "directory"
Set-Location -Path $ProjectName -PassThru
$Repo = Read-Host -Prompt 'Input the git repo to be cloned'
Write-Host "Creating New Project: '$ProjectName' Progress:[                                                  ] 0%"
Write-Host "Cloning '$Repo' into '$DirectoryPath'\'$ProjectName'"
Git clone -q $Repo .
Write-Host "Creating New Project: '$ProjectName' Progress:[░░░░                                              ] 8%"
Write-Host "Removing .git"
Rimraf .git
Write-Host "Creating New Project: '$ProjectName' Progress:[░░░░░░░░                                          ] 16%"
Write-Host "Installing Dependencies"
Yarn install --silent
Write-Host "Creating New Project: '$ProjectName' Progress:[░░░░░░░░                                          ] 17%"
Write-Host "Creating Root Directories"
$Invocation = Get-Location
$DirectoryPath = $Invocation.Path
Write-Host "Creating New Project: '$ProjectName' Progress:[░░░░░░░░░                                         ] 18%"
Write-Host "Creating src Directory"
New-Item -Path $DirectoryPath -Name "src" -ItemType "directory"
Write-Host "Creating New Project: '$ProjectName' Progress:[░░░░░░░░░                                         ] 19%"
Write-Host "Creating .vscode Directory"
New-Item -Path $DirectoryPath -Name ".vscode" -ItemType "directory"
Write-Host "Creating New Project: '$ProjectName' Progress:[░░░░░░░░░░                                        ] 20%"
Write-Host "Creating .nuget Directory"
New-Item -Path $DirectoryPath -Name ".nuget" -ItemType "directory"
Write-Host "Creating New Project: '$ProjectName' Progress:[░░░░░░░░░░                                        ] 21%"
Write-Host "Creating .blueprints Directory"
New-Item -Path $DirectoryPath -Name ".blueprints" -ItemType "directory"
Write-Host "Creating New Project: '$ProjectName' Progress:[░░░░░░░░░░░░                                      ] 25%"
Write-Host "Creating .NET Solution"