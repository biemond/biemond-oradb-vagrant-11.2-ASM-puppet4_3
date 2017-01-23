# class portmap::openbsd::services takes
# care about the state of the service on
# OpenBSD OS.

class portmap::openbsd::services (
    $ensure = running,
    $enable = true,
) {

    service { 'portmap':
        ensure => $ensure,
        enable => $enable,
    }

}
