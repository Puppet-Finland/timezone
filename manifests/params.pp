#
# == Class: timezone::params
#
# Defines some variables based on the operating system
#
class timezone::params {

    include ::os::params

    case $::osfamily {
        'RedHat': {
            $localtime_mode = '0644'
        }
        'Debian': {
            $localtime_mode = '0644'
        }
        'FreeBSD': {
            $localtime_mode = '0444'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
