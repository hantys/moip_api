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
			create_response resp
		end

		def list(path)
			resp = self.class.get path, opts()
			RStruct.new resp.parsed_response
		end

		def post(path, params, headers = nil)

			if headers == nil
				resp = self.class.post path, headers: opts()[:headers], body: params.to_json
			else
				resp = self.class.post path, headers: headers, body: params
			end
			create_response resp
		end

		def convert_hash_keys_to(conversion, value)
			case value
			when Array
				value.map { |v| convert_hash_keys_to(conversion, v) }
			when Hash
				Hash[value.map { |k, v| [send(conversion, k).to_sym, convert_hash_keys_to(conversion, v)] }]
			else
				value
			end
		end

		

		def get_base_uri
			if @version == :v2
				if production?
					(host== :connect) ? "https://connect.moip.com.br" : "https://api.moip.com.br/v2"
				else
					(host== :connect) ? "https://connect-sandbox.moip.com.br" : "https://sandbox.moip.com.br/v2"
				end
			elsif @version == :v1
				if production?
					"https://api.moip.com.br"
				else
					"https://desenvolvedor.moip.com.br/sandbox"
				end
			end
		end


		def camel_case(str)
			return str.to_s if str.to_s !~ /_/ && str.to_s =~ /[A-Z]+.*/
			words = str.to_s.split('_')
			(words[0..0] << words[1..-1].map{|e| e.capitalize}).join
		end

		def snake_case(str)
			str.gsub(/::/, '/').
			gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
			gsub(/([a-z\d])([A-Z])/,'\1_\2').
			tr("-", "_").
			downcase
		end
		
		def create_response(resp)
			json = convert_hash_keys_to(:snake_case, resp.parsed_response)
			response = RecursiveOpenStruct.new(json, :recurse_over_arrays => true)
			response
		end
		
		def basic_auth
			{username: @auth[:token], password: @auth[:secret]}
		end
	end
end


