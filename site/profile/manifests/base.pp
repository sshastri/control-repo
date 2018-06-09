#This is the base profile for all nodes
class profile::base {

  include profile::base::hosts
  include profile::app::puppet::agent

  if $facts['kernel'] == 'Linux' {
    include profile::base::vimpuppet
  }

}
