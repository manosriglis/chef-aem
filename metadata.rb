maintainer       "Manos Riglis"
maintainer_email "manos.riglis@blonde.net"
license          'Apache License, Version 2.0'
description      "AEM/VLT Installation Cookbook"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
name             "chef-aem"

supports "debian", ">= 6.0"
supports "centos", ">= 5.8"
supports "redhat", ">= 5.8"
supports "ubuntu", ">= 10.04"

depends "java"