class example::greg_demo_win_features {

$demo_features = [ 'NET-Framework-Core','Windows-Defender','Windows-Defender-GUI']

windowsfeature { $demo_features:
  ensure => present,
  }
  
windowsfeature { 'RDS-RD-Server':
  ensure  => present,
  }
 reboot {'after_RDS_RD_Server':
   when  => pending,
   subscribe => Windowsfeature['RDS-RD-Server'],
}
  
}
