# Drupal Project

Use this project as a template for working on Drupal core.

To create a new project, run the following:

## Requirements

You will neeed PHP 7.1+ and [Composer][5].

### MacOS

Download and install Homebrew follow the [online instructions][4].

Add the php tap:

```bash
brew tap homebrew/homebrew-php
brew install composer php71 php71-mcrypt php71-xdebug
```

## Installing

```bash
composer create-project -s dev previousnext/drupal-project myproject
```

## Docker

You will need to install Docker.

### OS-specific Installation

#### Linux

You know what you're doing, right?

#### MacOS

Download and install [Docker for Mac][1]

#### Windows

Download and install [Docker for Windows][2]

Download and install [Make for Windows][3]

## Docker Compose

Due to performance issues in Docker for Mac, you need a slightly different
docker-compose.yml file for MacOS. To simplify your commands, we recommend
creating an alias in `~/.bashrc` such as:

```
alias dc='docker-compose -f docker-compose.osx.yml'
```

To start the container, run:

```bash
dc up -d
```

## Setup and Install Drupal

To initialise your local dev environment run the following:

```bash
make init
make install
```

## Developer Options

To set up common developer options, run:

```bash
make devify
```

## Testing

To run tests, run:

```bash
make test
```

[1]: https://www.docker.com/docker-mac
[2]: https://www.docker.com/docker-windows
[3]: http://gnuwin32.sourceforge.net/packages/make.htm
[4]: https://brew.sh/
[5]: https://getcomposer.org
