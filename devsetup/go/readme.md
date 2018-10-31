

# Getting started
Setting up directory
	- Directory path should look something like.
	/Users/[yourUserId]/go/src/github.xx.com/lavasudevan
	- You'll need to create the github.xx.com and lavasudevan directories
   - cd or mkdir src/github.xx.com/lavasudevan
   - git clone
   - cd tools/stagehelper
    
## Building it for the first time
   - dep init
   - make deps
   - make tools

## Setting up your go path
	- If you installed Go in a directory such as "/Users/[yourUserId]/go", you'll likely need to add these so that the go tools are found ( I had issues with golint before adding exports below)

	export GOPATH=~/go
	export PATH=$PATH:$GOPATH/bin
