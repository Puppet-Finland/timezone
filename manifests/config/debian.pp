#
# == Class: timezone::config::debian
#
# Debian-specific timezone configuration
#
class timezone::config::debian
(
    $timezone
)
{
    file { 'timezone-timezone':
        ensure => present,
        name  => '/etc/timezone',
        owner => root,
        group => root,
        mode  => 644,
        content => "${timezone}\n",
    }
}
