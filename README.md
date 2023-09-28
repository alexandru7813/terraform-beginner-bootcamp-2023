# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage: :mage:
Go to: [semantiv versioning](https://semver.org/)

Given a version number MAJOR.MINOR.PATCH, ex. `1.0.1`:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

Additional documentation:

## Checking linux version
[checking linux version](https://www.geeksforgeeks.org/how-to-check-the-os-version-in-linux/)
## How to use shebang to make an bash file
[how to use shebang to make an bash file](https://en.wikipedia.org/wiki/Shebang_(Unix))
## Install terrafom cli
[install terrafom cli](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
## How to use chmod to change file permissions
[how to use chmod to change file permissions](https://en.wikipedia.org/wiki/Chmod)
## Gitpod Workspaces Task
**init** will not be rerun in a existing workspace -> use **before**

[gitpod workspaces tasks](https://www.gitpod.io/docs/configure/workspaces/tasks)

### Working Env Vars

#### env command

list out all Enviroment Variables (Env Vars) using the `env` command

filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

set using `export HELLO='world`

unset using `unset HELLO`

set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in thoes workspaces.

You can also set en vars in the `.gitpod.yml` but this can only contain non-senstive env vars.