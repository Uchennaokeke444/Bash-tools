Hari Sekhon - Bash Tools
========================
[![Build Status](https://travis-ci.org/HariSekhon/bash-tools.svg?branch=master)](https://travis-ci.org/HariSekhon/bash-tools)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c61193dd7dcc418b85149bddf93362e4)](https://www.codacy.com/app/harisekhon/bash-tools)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20OS%20X-blue.svg)](https://github.com/harisekhon/bash-tools#hari-sekhon---bash-tools)
[![DockerHub](https://img.shields.io/badge/docker-available-blue.svg)](https://hub.docker.com/r/harisekhon/centos-github/)

Bash Test & Utility library used by all my other [GitHub repos](https://github.com/harisekhon).

This has become a surprisingly important dependency repo as it contains tests for a wide variety of different programming languages and file formats, recursively detects and validates all relevant files for the following:

- Python (syntax, pep8, pre-byte-compiling)
- Perl
- Java
- Scala
- Make
- Maven
- SBT
- Gradle
- Travis CI 
- Ruby
- Shell
- Misc (whitespace etc)

Also pulls in many important validation programs from my [PyTools repo](https://github.com/harisekhon/pytools) to validate additional file formats including:

- csv
- json
- avro
- parquet
- ini / properties files (Java)
- ldap ldif
- multimedia (mp3, mp4)
- xml
- yaml

Currently utilized to supplement testing of the following repos:

* [Advanced Nagios Plugins Collection](https://github.com/harisekhon/nagios-plugins) - covers every major Hadoop & NoSQL technology and many infrastructure technologies
* [Perl Tools](https://github.com/harisekhon/tools) - 25 command line tools
* [Python Tools](https://github.com/harisekhon/pytools) - 50+ command line tools
* [Perl Lib](https://github.com/harisekhon/lib) - Perl utility library
* [PyLib](https://github.com/harisekhon/pylib) - Python utility library

[Pre-built Docker images](https://hub.docker.com/u/harisekhon/) are available for those repos (which include this one as a submodule) and the ["docker available"](https://hub.docker.com/r/harisekhon/centos-github/)  icon above links to an [uber image](https://hub.docker.com/r/harisekhon/centos-github/) which contains all my github repos pre-built. There are [Centos](https://hub.docker.com/r/harisekhon/centos-github/), [Debian](https://hub.docker.com/r/harisekhon/debian-github/) and [Ubuntu](https://hub.docker.com/r/harisekhon/ubuntu-github/) versions of this uber Docker image containing all repos.
