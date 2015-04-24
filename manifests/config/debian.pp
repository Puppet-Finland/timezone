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
        ensure  => present,
        name    => '/etc/timezone',
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0644',
        content => "${timezone}\n",
    }
}
