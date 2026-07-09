# A wrapper for the HouseCanary API to fetch public records about a property.
# @see https://api-docs.housecanary.com/#tag/Property-Level/
module Hcn
  # Embeds the logic of a HouseCanary property.
  class Property
    # @data [Hash] data the attributes of each provider
    # @option data [String] address Building number, street name, and optionally unit number
    # @option data [String] unit Unit number for the property
    # @option data [String] city City in which the property is located
    # @option data [String] zipcode 5-digit US zipcode in which the property is located
    def initialize(data = {})
      @data = data
    end

    # @return [Hash] Address information
    def subject_address = details[:subject_address]

    # @return [Hash] Public Record information
    def public_records = details[:public_records]

    # @return [Hash] Details about the most recent assessment
    def assessment = details[:assessment]

  private

    def details
      @details ||= fetch
    end

    def fetch
      uri = URI 'https://api.housecanary.com/v3/property/details_advanced'
      uri.query = URI.encode_www_form @data.merge(type: :public)

      request = Net::HTTP::Get.new uri
      request.basic_auth ENV['HOUSECANARY_API_KEY'], ENV['HOUSECANARY_API_SECRET']
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end
      raise Error unless response.is_a?(Net::HTTPSuccess)
      JSON(response.body).with_indifferent_access
    end
  end
end
