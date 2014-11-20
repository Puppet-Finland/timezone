#
# == Class: timezone
#
# Set the timezone
#
# == Parameters
#
# [*timezone*]
#   Path to the timezone file under /usr/share/zoneinfo, for example 
#   'Europe/Helsinki'. Note that timezones that do not refer to a certain 
#   geographical location seem to get appended with 'Etc/' when they're set 
#   using operating system's interactive tools. For example 'UTC' becomes 
#   'Etc/UTC'. It is recommended to use this notation to reduce the possibility 
#   of errors. The default value for this parameter is 'Etc/UTC'.
#
# == Authors
# 
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>  
#
# == License
#
# BSD-license. See file LICENSE for details.
# 
class timezone
(
    $timezone='Etc/UTC'

)
{

    # Timezone configuration varies a lot from one OS to another.
    case $::operatingsystem {
        /^(Debian|Ubuntu)$/: {
            class { 'timezone::config::linux':  timezone => $timezone }
            class { 'timezone::config::debian': timezone => $timezone }
        }
        /^(RedHat|CentOS)$/: {
            class { 'timezone::config::linux':  timezone => $timezone }
            class { 'timezone::config::redhat': timezone => $timezone }
        }
        default: {
            fail("Unsupported operating system: ${::osfamily}")
        }
    }
}
