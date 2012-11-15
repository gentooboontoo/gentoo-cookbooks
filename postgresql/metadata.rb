maintainer       "Julien Sanchez"
maintainer_email "julien.sanchez@lim.eu"
license          "Apache 2.0"
description      "Installs postgresql"
version          "0.0.1"

recipe           "postgresql", "Includes postgresql client"
recipe           "postgresql::server", "Installs postgresql server"
recipe           "postgresql::client", "Installs postgresql client"
supports         "gentoo"

