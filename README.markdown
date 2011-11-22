# Inittab Puppet Module

James Fryman <james@frymanet.com>

# Description

This class manages inittab entries on Linux systems

# Sample Usage:
      inittab { 'x':
        ensure   => 'present',
        runlevel => '345',
        action   => 'respawn',
        command  => '/etc/X11/prefdm -nodaemon',
      }
