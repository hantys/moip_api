module Moip
  class Config
    attr_reader :app_config

    def initialize
      @app_config ||= YAML.load_file(Rails.root.join("config/pagseguro.yml"))
      binding.pry
    end

    def api_token
      app_config['api_token']
    end

    def api_secret
      app_config['api_secret']
    end

    def id_app
      app_config['id']
    end

    def access_token
      app_config['access_token']
    end

    def secret
      app_config['secret']
    end

    def redirect_uri
      app_config['redirect_uri']
    end
  end
end
