require 'puppet/provider/parsedfile'
inittab_file = '/etc/inittab'

Puppet::Type.type(:inittab).provide(
  :parsed,
  :parent         => Puppet::Provider::ParsedFile,
  :default_target => inittab_file,
  :filetype       => :flat
) do
  
  confine :exists => inittab_file
  
  text_line :comment, :match => /^\s*#/;
  text_line :blank, :match => /^\s*$/;

  # Not sure why :optional is required, otherwise fails with
  # Inittab[<name>]: Could not evaluate: Field 'runlevel' is required
  # http://groups.google.com/group/puppet-users/browse_thread/thread/1d6f3eebbc39aa99
  # -JDF 2011/11/22
  record_line :parsed, 
    :fields    => %w{name runlevel action command},
    :optional  => %w{runlevel action command},
    :joiner    => ":",
    :separator => /:/
end