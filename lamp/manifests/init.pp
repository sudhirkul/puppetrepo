# Class: lamp
# ===========================
#
# Full description of class lamp here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'lamp':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2019 Your name here, unless otherwise noted.
#
class lamp {
# To install Appache Server
    $webserver = $osfamily ? {
      'RedHat' => 'httpd',
      'debian' => 'apache2',
       default => 'apache2',
       }
   package { $webserver:
       ensure => 'present',
       }
   service { $webserver:
       ensure => 'running',
       enable => true,
       }

# To installed and start the php

    $php = $osfamily ? {
      'RedHat' => 'php',
      'debian' => 'php.5.5',
       default => 'php',
       }

   package { $php:
       ensure => 'present',
       }
#   service { $php:
#      ensure => 'running',
#      enable => true,
#       }

# To installed MySql 
     $mysql = $osfamily ? {
      'RedHat' => 'mariadb-server',
      'debian' => 'mysql-server',
       default => 'mariadb-server',
       }
   package { $mysql:
       ensure => 'present',
       }
   service {mariadb:
       ensure => 'running',
       enable => true,
       }

}




