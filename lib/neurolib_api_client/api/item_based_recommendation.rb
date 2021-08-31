#
# This file is auto-generated, do not edit
#

module NeurolibApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  #Deprecated since version 2.0.0. Use RecommendItemsToItem request instead.
  #
  #Recommends set of items that are somehow related to one given item, *X*. Typical scenario for using item-based recommendation is when user *A* is viewing *X*. Then you may display items to the user that he might be also interested in. Item-recommendation request gives you Top-N such items, optionally taking the target user *A* into account.
  #
  # It is also possible to use POST HTTP method (for example in case of very long ReQL filter) - query parameters then become body parameters.
  #
  class ItemBasedRecommendation < ApiRequest
    attr_reader :item_id, :count, :target_user_id, :user_impact, :filter, :booster, :allow_nonexistent, :cascade_create, :scenario, :return_properties, :included_properties, :diversity, :min_relevance, :rotation_rate, :rotation_time, :expert_settings
    attr_accessor :timeout
    attr_accessor :ensure_https

  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item for which the recommendations are to be generated.
  #   - +count+ -> Number of items to be recommended (N for the top-N recommendation).
  #
  # * *Optional arguments (given as hash optional)*
  #   - +targetUserId+ -> ID of the user who will see the recommendations.
  #
  #Specifying the *targetUserId* is beneficial because:
  #
  #* It makes the recommendations personalized
  #* Allows the calculation of Actions and Conversions in the graphical user interface,
  #  as Neurolib can pair the user who got recommendations and who afterwards viewed/purchased an item.
  #
  #For the above reasons, we encourage you to set the *targetUserId* even for anonymous/unregistered users (i.e. use their session ID).
  #
  #   - +userImpact+ -> If *targetUserId* parameter is present, the recommendations are biased towards the user given. Using *userImpact*, you may control this bias. For an extreme case of `userImpact=0.0`, the interactions made by the user are not taken into account at all (with the exception of history-based blacklisting), for `userImpact=1.0`, you'll get user-based recommendation. The default value is `0`.
  #
  #   - +filter+ -> Boolean-returning [ReQL](https://www.neurolib.io/pages/documentation) expression which allows you to filter recommended items based on the values of their attributes.
  #   - +booster+ -> Number-returning [ReQL](https://www.neurolib.io/pages/documentation) expression which allows you to boost recommendation rate of some items based on the values of their attributes.
  #   - +allowNonexistent+ -> Instead of causing HTTP 404 error, returns some (non-personalized) recommendations if either item of given *itemId* or user of given *targetUserId* does not exist in the database. It creates neither of the missing entities in the database.
  #   - +cascadeCreate+ -> If item of given *itemId* or user of given *targetUserId* doesn't exist in the database, it creates the missing enity/entities and returns some (non-personalized) recommendations. This allows for example rotations in the following recommendations for the user of given *targetUserId*, as the user will be already known to the system.
  #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be for example "homepage", "cart" or "emailing". You can see each scenario in the UI separately, so you can check how well each application performs. The AI which optimizes models in order to get the best results may optimize different scenarios separately, or even use different models in each of the scenarios.
  #   - +returnProperties+ -> With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used for easy displaying of the recommended items to the user.
  #
  #Example response:
  #```
  #  [
  #    {
  #      "itemId": "tv-178",
  #      "description": "4K TV with 3D feature",
  #      "categories":   ["Electronics", "Televisions"],
  #      "price": 342,
  #      "url": "myshop.com/tv-178"
  #    },
  #    {
  #      "itemId": "mixer-42",
  #      "description": "Stainless Steel Mixer",
  #      "categories":   ["Home & Kitchen"],
  #      "price": 39,
  #      "url": "myshop.com/mixer-42"
  #    }
  #  ]
  #```
  #
  #   - +includedProperties+ -> Allows to specify, which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list.
  #
  #Example response for `includedProperties=description,price`:
  #```
  #  [
  #    {
  #      "itemId": "tv-178",
  #      "description": "4K TV with 3D feature",
  #      "price": 342
  #    },
  #    {
  #      "itemId": "mixer-42",
  #      "description": "Stainless Steel Mixer",
  #      "price": 39
  #    }
  #  ]
  #```
  #
  #   - +diversity+ -> **Expert option** Real number from [0.0, 1.0] which determines how much mutually dissimilar should the recommended items be. The default value is 0.0, i.e., no diversification. Value 1.0 means maximal diversification.
  #
  #   - +minRelevance+ -> **Expert option** If the *targetUserId* is provided:  Specifies the threshold of how much relevant must the recommended items be to the user. Possible values one of: "low", "medium", "high". The default value is "low", meaning that the system attempts to recommend number of items equal to *count* at any cost. If there are not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations to be appended to reach the full *count*. This behavior may be suppressed by using "medium" or "high" values. In such case, the system only recommends items of at least the requested qualit, and may return less than *count* items when there is not enough data to fulfill it.
  #
  #   - +rotationRate+ -> **Expert option** If the *targetUserId* is provided: If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Neurolib API allows you to control this per-request in backward fashion. You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example `rotationRate=0.2` for only slight rotation of recommended items. Default: `0.01`.
  #
  #   - +rotationTime+ -> **Expert option** If the *targetUserId* is provided: Taking *rotationRate* into account, specifies how long time it takes to an item to recover from the penalization. For example, `rotationTime=7200.0` means that items recommended less than 2 hours ago are penalized. Default: `7200.0`.
  #
  #   - +expertSettings+ -> Dictionary of custom options.
  #
  #
    def initialize(item_id, count, optional = {})
      @item_id = item_id
      @count = count
      optional = normalize_optional(optional)
      @target_user_id = optional['targetUserId']
      @user_impact = optional['userImpact']
      @filter = optional['filter']
      @booster = optional['booster']
      @allow_nonexistent = optional['allowNonexistent']
      @cascade_create = optional['cascadeCreate']
      @scenario = optional['scenario']
      @return_properties = optional['returnProperties']
      @included_properties = optional['includedProperties']
      @diversity = optional['diversity']
      @min_relevance = optional['minRelevance']
      @rotation_rate = optional['rotationRate']
      @rotation_time = optional['rotationTime']
      @expert_settings = optional['expertSettings']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["targetUserId","userImpact","filter","booster","allowNonexistent","cascadeCreate","scenario","returnProperties","includedProperties","diversity","minRelevance","rotationRate","rotationTime","expertSettings"].include? par
      end
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['count'] = @count
      p['targetUserId'] = @optional['targetUserId'] if @optional.include? 'targetUserId'
      p['userImpact'] = @optional['userImpact'] if @optional.include? 'userImpact'
      p['filter'] = @optional['filter'] if @optional.include? 'filter'
      p['booster'] = @optional['booster'] if @optional.include? 'booster'
      p['allowNonexistent'] = @optional['allowNonexistent'] if @optional.include? 'allowNonexistent'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['scenario'] = @optional['scenario'] if @optional.include? 'scenario'
      p['returnProperties'] = @optional['returnProperties'] if @optional.include? 'returnProperties'
      p['includedProperties'] = @optional['includedProperties'] if @optional.include? 'includedProperties'
      p['diversity'] = @optional['diversity'] if @optional.include? 'diversity'
      p['minRelevance'] = @optional['minRelevance'] if @optional.include? 'minRelevance'
      p['rotationRate'] = @optional['rotationRate'] if @optional.include? 'rotationRate'
      p['rotationTime'] = @optional['rotationTime'] if @optional.include? 'rotationTime'
      p['expertSettings'] = @optional['expertSettings'] if @optional.include? 'expertSettings'
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
      "/{databaseId}/items/#{@item_id}/recomms/"
    end
  end
end
