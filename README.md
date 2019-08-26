# hot-reload-on-docker-container

## Install `goenv` that is Golang version control library

```
git clone https://github.com/syndbg/goenv.git ~/.goenv
```

Add settings to `~/.bash_profile` bellow codes:

```
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
```

## Set Golang version

```
# Check avalilable versions
goenv install -l

# Install specific version
goenv install {GO_VERSION}

# Check installed versions
goenv versions

# set local folder version
goenv local {GO_VERSION}

# Check current version
goenv version
```

## After you execute `goenv install -l`, if you can`t find your wanna version.

See bellow page
https://github.com/syndbg/goenv/tree/master/plugins/go-build/share/go-build

If your wanna version exists in the page, you can use it by doing below operation.

```
mkdir ./versions/{GO_VERSION}
go-build {GO_VERSION} ./versions/{GO_VERSION}
```

## Install `direnv` that is automatic setting env library and setting.

```
git clone https://github.com/direnv/direnv ~/.direnv
cd ~/.direnv
sudo make install
```

```
# Open env file in `vi`
direnv edit .

# Set golang version to system environment by reading `.go-version` 
export GO_VERSION=$(cat .go-version)
```

### After change go version...

If you execute `goenv local {OTHER_VESION}`.

You should do resetting.
`source .envrc`

## Run local server: http://localhost:8080

```
# Normally
docker-compose up -d

# After change Dockerfile or go version(rebuild image)
docker-compose up -d --build

# Stop server
docker-compose stop

# Delete containers
docker-compose rm -f
```

### You can request endpoints

```
# only root endpoint
curl -XGET http://localhost:8080

```
