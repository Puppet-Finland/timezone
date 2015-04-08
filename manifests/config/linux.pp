#
# == Class: timezone::config::linux
#
# Configuration common to all/most Linux distributions
#
class timezone::config::linux
(
    $timezone

) inherits timezone::params
{
    file { 'timezone-localtime':
        name  => '/etc/localtime',
        ensure => present,
        source => "/usr/share/zoneinfo/${timezone}",
        links => follow,
        owner => root,
        group => $::os::params::admingroup,
        mode  => $::timezone::params::localtime_mode,
    }
}
