# Class: mymodule
# ===========================
#
# Full description of class mymodule here.
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
#    class { 'mymodule':
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
class mymodule {
   $webserver = $osfamily ? {
     'RedHat' => 'httpd',
     'Debian' => 'apache2',
     default  => 'apache2'
   }

 Package { $webserver:
    ensure => 'present'
   }

 Service { $webserver:
    ensure => 'running',
    enable => true
   } 

  file { 'index.html':
       ensure  => 'present',
       path    => '/var/www/html/index.html',
       content => "<!doctype html>
                <title>Welcome Page</title>
                <style>
                body { text-align: center; padding: 150px; }
                h1 { font-size: 50px; }
                  body { font: 20px Helvetica, sans-serif; color: #333; }
                  article { display: block; text-align: left; width: 650px; margin: 0 auto; }
                  a { color: #dc8100; text-decoration: none; }
                  a:hover { color: #333; text-decoration: none; }
                </style>

                <article>
                <h2>Hello, Welcome to the training session on Puppet!</h2>
                 <div>
                     <p>Puppet is a very cool tool for configuration management.</p>
                     <p>&mdash; Ganesh Palnitkar</p>

                 </div>
                </article>"
       }
}

