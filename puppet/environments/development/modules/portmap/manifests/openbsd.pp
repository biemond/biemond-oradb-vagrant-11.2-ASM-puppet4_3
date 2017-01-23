# portmap::openbsd takes care about OpenBSD
# specific parameters.

class portmap::openbsd (
    $service = running,
    $enable  = true,
) {

    anchor { 'portmap::openbsd::begin': }

    class { 'portmap::openbsd::services':
        ensure => $service,
        enable => $enable,
    }

    anchor { 'portmap::openbsd::end': }

}
