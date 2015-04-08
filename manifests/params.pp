#
# == Class: timezone::params
#
# Defines some variables based on the operating system
#
class timezone::params {

    include os::params

    case $::osfamily {
        'RedHat': {
            $localtime_mode = 644
        }
        'Debian': {
            $localtime_mode = 644
        }
        'FreeBSD': {
            $localtime_mode = 444
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
