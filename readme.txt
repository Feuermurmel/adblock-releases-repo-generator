# AdBlock source releases as a Git repository

This script helps you create a Git Repository from the [source releases](http://code.getadblock.com/releases/) of [AdBlock](https://getadblock.com).


## Preparations

Create a directory called `archives` in the root of this repository. Put all source releases as ZIP archives into that directory.

Look at the files `adblock.txt` and `firefox.txt` for the names these files should have. The file names of the AdBlock-Firefox releases were not entirely consistent and so I changed them.

The files `adblock.txt` and `firefox.txt` are used to define the order in which the archives are converted into commits.


## Running the script.

The script `create.sh` can then be run for each branch that should be created:

	./create.sh AdBlock-Firefox firefox
	./create.sh AdBlock adblock

The first argument is the name used in the commit messages to refer to the project. The second argument is the "identifier" of the project. It is used as the name of the branch as a prefix for the names of the tags that are create. It is also used to look for the file listing the ZIP archives by appending `.zip` to the identifier.

When the script has finished, you should have a Git repository under `repo/` with a single new branch and a new tagged commit for each release.
