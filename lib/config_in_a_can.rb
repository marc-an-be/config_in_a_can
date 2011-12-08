module Config
  extend self
  @_config = {}
  @logger = nil
  def init(logger=nil, &block)
    @logger = logger
    instance_eval &block
  end

  def method_missing(name, *args, &block)
    name = (name.to_s.end_with?('=','?') ? name.to_s[0..-2] : name).to_sym
    return @_config[name] = (args.count == 1 ? args.first : args) if args.any? #&& !@_config.key?(name) # want it unmodifiable?
    return @_config[name] if @_config.key?(name)
    @logger.warn("Key '#{name}' is undefined!") if @logger
    nil
  end
end
