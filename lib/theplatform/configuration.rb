module ThePlatform

  # Module to extend to other Classes in order to set up #configuration on a per object basis
  module Configuration

    extend self

    attr_accessor :schema, :form, :token, :username, :password, :_duration, :_idleTimeout

    # Allows for a Rails type configuration setup.  Different object make different configurations.
    #
    #    ThePlatform::Data.configure do |config|
    #      config.schema = '1.4.0'
    #      config.form = 'cjson'
    #      config.token = 'o4VThP--IcaKwltckmgdw544KD0kKDg'
    #    end
    #    =>  {:schema=>"1.4.0", :form=>"json", :token=>"o4VThP--IcaKwltckmgdw544KD0kKDg"}
    #
    def configure
      yield self
      parameters
    end

    # List available parameters and values in those params
    def parameters
      @values = {}
      keys.each { |k| @values.merge! k => get_var(k) unless get_var(k) == nil }
      @values
    end

    # Returns true or false if all parameters are set.
    def parameters?
      parameters.keys == keys
    end

    private

    # Helper to clean up recursive method in #parameters
    def get_var(var)
      self.instance_variable_get("@#{var}")
    end

  end
end
