Puppet::Type.newtype(:inittab) do
  @doc = "Management of inittab entries
  inittab { 'x':
    ensure   => present,
    runlevel => '5',
    action   => 'respawn',
    process  => '/etc/X11/prefdm -nodaemon',
  }"
  
  ensurable
  
  newparam(:name, :namevar => true) do
    desc "a unique sequence of 1-4 characters which identifies an entry in inittab"
    isnamevar
    
    validate do |value|
      if value.length > 4
        raise Puppet::Error, "namevar must be 1-4 characters in length"
      end
    end
  end
  
  newproperty(:runlevel) do
    desc "Indicates which runlevels this process should be evaluated against"
    
    validate do |value|
      unless value =~ /^[1-6a-cA-C]+$/
        raise Puppet::Error, "Runlevel contains invalid values: #{value}"
      end
    end
  end

  newproperty(:action) do
    desc "Describes which action should be taken"
    newvalues(
      :respawn, :wait, :once, :boot, :bootwait, :off, :ondemand,
      :initdefault, :sysinit, :powerwait, :powerfail, :powerokwait,
      :powerfailnow, :ctrlaltdel, :kbrequest
    )
  end
  
  newproperty(:command) do
    desc "Specifies the process to be executed. If the process field starts with a ‘+’ character, init will not do utmp and wtmp accounting for that process.  This is needed for gettys that insist on doing their own utmp/wtmp housekeeping."
  end
  

end