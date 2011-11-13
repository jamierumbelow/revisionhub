# Gittastic
#
# A really little and lightweight Ruby wrapper 
# to the Git interface.
#
# by Jamie Rumbelow
# http://jamierumbelow.net

class Gittastic
  
  # Accessible attributes
  attr_accessor :path, :cmd
  
  # Create a new Gittastic instance.
  #
  # path    - The String path to the root directory
  #           of the repository
  def initialize(path)
    @path = File.expand_path(path)
    @cmd = 'git'
    
    unless File.exist?(File.join(@path, '.git'))
      raise Exception.new("Invalid Git repository: #{@path}")
    end
  end
  
  # The clever bit: method_missing provides a proxy
  # onto the same Gittastic instance (by returning
  # self) and thus lets us build up.
  def method_missing(method, *arguments, &block)
    @cmd << " #{method.to_s}"
    cmdify(arguments) if arguments
    
    self
  end
  
  # Execute the command and return the result
  def !
    `cd #{@path} && #{@cmd}`
  end
  
  # A short helper method to link methods together
  def and
    @cmd << " && git"
    self
  end
  
  # Clear the command
  def clear!
    @cmd = 'git'
  end
  
  protected
  
  # Convert a hash of arguments into command-line flags
  def cmdify(args)
    args = args[0]
    
    if args.class == Hash
      args.each do |name, arg|
        @cmd << " #{name} #{arg}"
      end
    elsif args.class == String
      @cmd << " #{args}"
    end
  end
  
end