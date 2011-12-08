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

    # overwrite environment specifics in environment files or via switch
    Config.init do
      hosts     ['localhost', 'testhost01']
      port      1234
    end unless ENV['RACK_ENV'] == 'production'

    # access
    p Config.app_name
    p Config.hosts

    # (re)define values outside the init block
    Config.port 5555
    Config.port = 6666 # this syntax is also possible for convenience
    p Config.some_bool  # this is the same as...
    p Config.some_bool? # ...this
