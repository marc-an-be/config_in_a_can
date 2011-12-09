module Config
  extend self
  @_config = {}
  @missing_key_proc = proc{}

  def init(&block)
    instance_eval &block
  end

  def freeze
    @_config.freeze
  end

  def on_missing_key(&block)
    @missing_key_proc = block_given? ? block : proc{}
  end

  def method_missing(name, *args, &block)
    name = (name.to_s.end_with?('=','?') ? name.to_s[0..-2] : name).to_sym
    return @_config[name] = (args.count == 1 ? args.first : args) if args.any?
    return @_config[name] if @_config.key?(name)
    @missing_key_proc.call name
    nil
  end
end
