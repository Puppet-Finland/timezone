#
# == Class: timezone::config::freebsd
#
# FreBSD-specific timezone setup
#
class timezone::config::freebsd
(
    $timezone

) inherits timezone::params
{

    # FreeBSD and Linux timezone configuration is identical
    class { 'timezone::config::linux':
        timezone => $timezone,
    }
}

