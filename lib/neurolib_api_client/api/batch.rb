require 'json'
require 'cgi'
require_relative 'request'

module NeurolibApiClient
  ##
  # Batch processing allows you to submit arbitrary sequence of requests
  #
  class Batch < ApiRequest
    attr_reader :requests
    attr_accessor :timeout
    attr_accessor :ensure_https
    ##
    # * *Required arguments*
    #   - +requests+ -> Array of API requests.
    #
    def initialize(requests, optional = {})
      @requests = requests
      optional = normalize_optional(optional)
      @optional = optional
      @body_parameters = requests_to_batch_hash
      @timeout = requests.map{|r| r.timeout}.reduce(:+)
      @ensure_https = true

      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["distinctRecomms"].include? par
      end
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    attr_reader :body_parameters

    # Values of query path parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end

    # Relative path to the endpoint
    def path
      p = '/{databaseId}/batch/'
      p
    end

    private

    def requests_to_batch_hash
      reqs = []
      @requests.each { |r| reqs.push(request_to_batch_hash r) }
      result = {'requests' => reqs}
      result['distinctRecomms'] = @optional['distinctRecomms'] if @optional.key? 'distinctRecomms'
      result
    end

    def request_to_batch_hash(req)
      path = req.path
      path.slice! ('/{databaseId}')
      bh = {
        'method' => req.method.to_s.upcase,
        'path' => path
      }
      params = req.query_parameters

      if req.body_parameters
        params = params.merge(req.body_parameters)
      end

      bh['params'] = params if params.size > 0
      bh
    end
  end
end
