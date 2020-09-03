class FoodFinder::Buisness
    attr_accessor :address, :price, :website, :food_type, :phone_number, :rating, :review_count
    attr_reader :name
    
    @@all = []

    def initialize(name)
        @name = name 
    end

    def self.output(businesses)
        businesses.each do |business|
            if business["is_closed"] == false
                business["name"] = new(business["name"])
                business["name"].address = business["location"]["display_address"]
                business["name"].phone_number = business["display_phone"]
                business["name"].rating = business["rating"]
                business["name"].food_type = business["categories"]
                business["name"].price = business["price"]
                business["name"].website = business["url"]
                business["name"].review_count = business["review_count"]
             
                @@all << business["name"]
            end
        end
        self.sort
        self.display
    end

    def self.display  
        @@all.each.with_index(1) do |business, index|
            puts "\n#{index}. Name: #{business.name} \n   Category: #{business.food_type[0]["title"]} \n   Rating: *#{business.rating} \n   Review Count: ##{business.review_count} \n   Phone Number:#{business.phone_number} 
   Price: #{business.price} \n   Address: #{business.address.join(" ")} \n   Website: #{business.website}" 
        end
    end
    
    def self.sort 
       @@all = @@all.sort_by(&:rating).reverse 
    end

    def self.all
        @@all
    end
end