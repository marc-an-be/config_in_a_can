**config_in_a_can - A minimalistic configuration Gem**

Usage
-----
        # Simple initialization
    Config.init do
      app_name    'super uper app'
      hosts       ['host1', 'host2', 'host3']
      more_hosts  'machine1', 'machine2', 'machine3' # or without brackets
      port        8888
      some_bool   true
    end

    # You can overwrite environment specifics if you wish
    Config.init do
      hosts     ['localhost', 'testhost01']
      port      1234
    end unless ENV['RACK_ENV'] == 'production'

    # This little thingy lets you define a callback for missing keys
    Config.on_missing_key do |key|
      puts "Key '#{key}' missing!"
    end

    # Access your new config ... it likes that
    p Config.app_name
    p Config.hosts
    p Config.some_bool  # this is the same as...
    p Config.some_bool? # ...this
    p Config.undefined_val # and this will call our on_missing_key block

    # You can also (re)define values outside the init block
    Config.port 5555
    Config.port = 6666 # this syntax is also possible for convenience

    # But if you think this is evil just freeze it!
    Config.freeze
    Config.port 9999 # crash boom!

