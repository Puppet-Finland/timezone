#
# == Class: timezone::config::linux
#
# Configuration common to all/most Linux distributions
#
class timezone::config::linux
(
    $timezone
)
{
    include os::params

    file { 'timezone-localtime':
        name  => '/etc/localtime',
        ensure => present,
        source => "/usr/share/zoneinfo/${timezone}",
        links => follow,
        owner => root,
        group => "${::os::params::admingroup}",
        mode  => 644,
    }
}
