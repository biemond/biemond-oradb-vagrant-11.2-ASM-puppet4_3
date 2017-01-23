class portmap::rhel::packages (
    $ensure = installed,
) {

    $packages = $::operatingsystem ? {
        'Amazon' => 'rpcbind',
        default  => $::operatingsystemmajrelease ? {
            '5' => 'portmap',
            '6' => 'rpcbind',
            '7' => 'rpcbind',
      }
    }

    package { $packages:
        ensure => $ensure,
    }

}
