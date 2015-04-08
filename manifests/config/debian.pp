#
# == Class: timezone::config::debian
#
# Debian-specific timezone configuration
#
class timezone::config::debian
(
    $timezone

) inherits timezone::params
{
    file { 'timezone-timezone':
        ensure => present,
        name  => '/etc/timezone',
        owner => root,
        group => "${::os::params::admingroup}",
        mode  => 644,
        content => "${timezone}\n",
    }
}
