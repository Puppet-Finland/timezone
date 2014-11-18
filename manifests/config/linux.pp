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
    file { 'timezone-localtime':
        name  => '/etc/localtime',
        ensure => link,
        owner => root,
        group => root,
        mode  => 644,
        target => "/usr/share/zoneinfo/${timezone}",
    }
}
