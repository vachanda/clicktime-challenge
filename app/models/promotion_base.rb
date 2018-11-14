class PromotionBase < ActiveRecord::Base
	self.abstract_class = true

	validate :preference_structure

	after_find do
    	if has_attribute?(:preferences)
    		parsed_preferences = JSON.parse(self.preferences)

    		parsed_preferences.each do |key, value|
    			self.__send__("#{key}=", value)
    		end
    	end
  	end

  	def preference_structure
  		JSON.parse(preferences)
  	rescue JSON::ParserError => _e
  		errors[:base] << "preferences should be a valid json."
  	end
end