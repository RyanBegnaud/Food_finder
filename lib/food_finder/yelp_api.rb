require "http"

class FoodFinder::YelpApi
    API_KEY = "r-XGP4L-bDEy3qbR_RXAYsQMEReOcZyNh1BTOy5g7z8PJhVt5oN26x0VU17Y2W42fsSmI2ySOT-aV6gKfxVhzjopkerGXZJQ8ADhMMMm0hrnh3XD5N7HHIeajsQ6X3Yx"
    API_HOST = "https://api.yelp.com/v3/businesses/search"
    
    def self.search(term = "food", location)
       params = {
          term: term,
          location: location,
          limit: 5
        } 
        response = HTTP.auth("Bearer #{API_KEY}").get(API_HOST, params: params)
        response.parse["businesses"] 
    end 
end

  