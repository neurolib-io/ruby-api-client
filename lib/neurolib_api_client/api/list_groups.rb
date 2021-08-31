#
# This file is auto-generated, do not edit
#

module NeurolibApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  #Gets the list of all the groups currently present in the database.
  class ListGroups < ApiRequest

    attr_accessor :timeout
    attr_accessor :ensure_https

  ##
  #
    def initialize()
      @timeout = 100000
      @ensure_https = false
    end

    # HTTP method
    def method
      :get
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/groups/list/"
    end
  end
end
