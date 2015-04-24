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
        ensure => present,
        name   => '/etc/localtime',
        source => "/usr/share/zoneinfo/${timezone}",
        links  => follow,
        owner  => $::os::params::adminuser,
        group  => $::os::params::admingroup,
        mode   => $::timezone::params::localtime_mode,
    }
}
