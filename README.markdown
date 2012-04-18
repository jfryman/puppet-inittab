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

# Legacy Clients (0.24)
In order for legacy clients to be able to use this module,
please make the following changes:

* Move the 'lib' dir to 'plugins' (http://docs.puppetlabs.com/guides/plugins_in_modules.html#legacy-024x-and-plugins-in-modules)
* Remove the newvalues() parameter from 'plugins/puppet/type/inittab.rb' from the newproprty(:action) block.
* Profit???

The newvalues() is not a supported parameter in Puppet 0.24. While removing
this line also removes some safety from the module, it makes it usable.
It is very possible there is an ideal solution to this, but this
notification is intended for clients that cannot upgrade for whatever
reason.
