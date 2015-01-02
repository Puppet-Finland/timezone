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
        ensure => link,
        owner => root,
        group => "${::os::params::admingroup}",
        mode  => 644,
        target => "/usr/share/zoneinfo/${timezone}",
    }
}
