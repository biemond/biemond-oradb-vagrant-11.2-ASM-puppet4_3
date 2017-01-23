class portmap::rhel::services (
    $ensure = running,
    $enable = true,
) {

    $services = $::operatingsystem ? {
        'Amazon' => 'rpcbind',
        default  => $::operatingsystemmajrelease ? {
            '5' => 'portmap',
            '6' => 'rpcbind',
            '7' => 'rpcbind',
        }
    }

    service { $services:
        ensure => $ensure,
        enable => $enable,
    }

}
