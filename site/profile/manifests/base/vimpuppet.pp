#Install vim, and vim-puppet
class profile::base::vimpuppet{

  file {'/root/.vim':
    ensure => directory,
  }

  file {'/root/.vimrc':
    ensure => file,
    source => 'puppet:///modules/profile/base/vimrc',
  }

  vcsrepo { '/root/.vim':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/rodjek/vim-puppet.git',
  }

  package {'vim':
    ensure => installed,
  }

  package {'git':
    ensure => installed,
  }

}
