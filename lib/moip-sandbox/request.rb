module Moip
  module Request
    def self.build_request(method, base_url, endpoint)
      resource = base_url+endpoint
      RestClient::Request.execute(method: method, url: resource, headers: default_headers)
    end

    def self.new_account_request(base_url, endpoint, params)
      resource = base_url+endpoint
      RestClient.post resource, params.to_json, auth_headers
    end

    private

    def self.load_config
      @config = YAML.load_file('config/moip.yml')
      @api_key = @config["production"]["api_token"]
      @api_secret = @config["production"]["api_secret"]
      @id = @config["production"]["id"]
      @access_token = @config["production"]["access_token"]
      @secret = @config["production"]["secret"]
      @redirect_uri = @config["production"]["redirect_uri"]
      @token = Base64.strict_encode64("#{@api_key}:#{@api_secret}")
    end

    def self.default_headers
      self.load_config
      {
        "Content-Type": "application/xml",
        "Authorization": "Basic #{@token}"
      }
    end

    def self.auth_headers
      self.load_config
      {
        "Content-Type": "application/json",
        "Authorization": "OAuth #{@secret}"
      }
    end
  end
end