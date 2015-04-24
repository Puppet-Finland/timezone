#
# == Class: timezone::config::redhat
#
# RedHat-specific timezone configuration
#
class timezone::config::redhat
(
    $timezone

) inherits timezone::params
{
    augeas { 'timezone-clock':
        context => '/files/etc/sysconfig/clock',
        changes => "set ZONE ${timezone}",
        lens    => 'Shellvars.lns',
        incl    => '/etc/sysconfig/clock',
    }
}
