module Moip
	class Client
		include HTTParty

		attr_reader :env, :auth, :uri

		def initialize(env = :sandbox, auth = nil, version = :v2, opts = {})
	        @env, @auth, @version, @opts = env.to_sym, auth, version, opts

			@uri = get_base_uri
			self.class.base_uri @uri
		end

		def sandbox?
			env == :sandbox
		end

		def production?
			env == :production
		end

		def opts
			opts = @opts
			opts[:headers] ||= {}

			opts[:headers].merge!(
				{
					"Content-Type": "application/json",
					"Authorization": auth.header
				}
			)

			opts
		end

		def get(path)
			resp = self.class.get path, opts()

			resp.parsed_response
			# create_response resp
		end

		def post(path, params)

			resp = self.class.post path, headers: opts()[:headers], body: params.to_json

			resp
			# create_response resp
		end

		private
		def get_base_uri
			return ENV["base_uri"] if ENV["base_uri"]

			if @version == :v2
				if production?
				else
					"https://sandbox.moip.com.br/v2"
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