#
# This file is auto-generated, do not edit
#

module NeurolibApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  #List all the detail views of a given item ever made by different users.
  class ListItemDetailViews < ApiRequest
    attr_reader :item_id
    attr_accessor :timeout
    attr_accessor :ensure_https

  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item of which the detail views are to be listed.
  #
  #
    def initialize(item_id)
      @item_id = item_id
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
      "/{databaseId}/items/#{@item_id}/detailviews/"
    end
  end
end
