# This profile sets up the config for a Puppet Compile Master
class profile::app::puppet::compilemaster {

  # Export a balancermember server for the loadbalancer
  @@haproxy::balancermember { "puppet-agent-${facts['fqdn']}":
    listening_service => 'puppet00',
    server_names      => $facts['hostname'],
    ipaddresses       => $facts['ipaddress'],
    ports             => '8140',
    options           => 'check',
  }

  @@haproxy::balancermember { "pxp-agent-${facts['fqdn']}":
    listening_service => 'puppet01',
    server_names      => $facts['hostname'],
    ipaddresses       => $facts['ipaddress'],
    ports             => '8142',
    options           => 'check',
  }


  #Enable the Service Now Custom Report processor
  include custom_report::servicenow
  ini_setting { 'Set custom reports':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'reports',
    value   => 'puppetdb, servicenow',
  }


}
