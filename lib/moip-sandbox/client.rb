module Moip
	class Client
		include HTTParty	

		attr_reader :env, :auth, :uri

		def initialize(env = :sandbox, auth = nil, opts = {})
			@env, @auth, @opts = env.to_sym, auth, opts

			@uri = get_base_uri
			self.class.base_uri @uri
		end

		def opts
			opts = @opts
			opts[:headers] ||= {}

			opts[:headers].merge!(
				{
					"Content-Type": "application/xml",
					"Authorization": auth.header	
				}
			)

			opts
		end

		def get(path)
			resp = self.class.get path, opts()

			create_response resp
		end

		private 
		def get_base_uri
			return ÉNV["base_uri"] if ENV["base_uri"]

			if production?
			else
				"https://desenvolvedor.moip.com.br/sandbox"
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