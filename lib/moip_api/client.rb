module Moip
	class Client
		include HTTParty

		attr_accessor :env, :auth, :uri, :host

		def initialize(env = :development, auth = nil, host=nil, version = :v2, opts = {})
	        @env, @auth, @version, @opts, @host = env.to_sym, auth, version, opts, host

			@uri = get_base_uri
			self.class.base_uri @uri
		end

		def development?
			env == :development
		end

		def production?
			env == :production
		end

		def opts
			opts = @opts
			opts[:headers] ||= {}

			opts[:headers].merge!(
				{
					'Content-Type' => 'application/json',
					'Authorization' => auth.header
				}
			)

			opts
		end

		def get(path, headers = nil)
			if headers == nil
				resp = self.class.get path, opts()
			else
				resp = self.class.get path, headers: headers
			end

			resp.parsed_response
			# create_response resp
		end

		def post(path, params, headers = nil)

			if headers == nil
				resp = self.class.post path, headers: opts()[:headers], body: params.to_json
			else
				resp = self.class.post path, headers: headers, body: params
			end

			resp
			# create_response resp
		end

		private
		def get_base_uri
			return ENV["base_uri"] if ENV["base_uri"]

			if @version == :v2
				if production?
				else
					(host== :connect) ? "https://connect-sandbox.moip.com.br" : "https://sandbox.moip.com.br/v2"
				end
			elsif @version == :v1
				if production?
				else
					"https://desenvolvedor.moip.com.br/sandbox"
				end
			end
		end

		def create_response(resp)
			raise NotFoundError, "Resource not found" if resp.code == 404
		end

		def basic_auth
			{username: @auth[:token], password: @auth[:secret]}
		end
	end
end