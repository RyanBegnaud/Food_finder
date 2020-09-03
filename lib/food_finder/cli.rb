class FoodFinder::CLI
    
    def call 
        get_input 
        FoodFinder::Buisness.output(FoodFinder::YelpApi.search(@food, @zip))
        new_search
    end

    def get_input
        puts "Please enter the 5 digit area code where you would like to look for food!"
        @zip = gets.strip 
        test = valid
 
        while test != true 
            puts "Invalid entry, Please enter the 5 digit area code where you would like to look for food!"
            @zip = gets.strip  
            test = valid
        end

        if test == true 
            puts "Is there a type of Food or a specific Restaurant you're looking for?(type yes) If not hit enter."
            @food_yes_no = gets.strip 
            food_search 
        end
    end

    def valid
        if @zip.length == 5
            true 
        else 
            false 
        end
    end

    def food_search 
        if @food_yes_no == "yes" || @food_yes_no == "Yes"
            puts "What Food or Restaurant are you looking for today?"
            @food = gets.strip
        end
    end

    def new_search  
        puts "\nWould you like to search again?(Type 'yes' for yes) and (hit 'enter' for no)"
        user_input = gets.strip  
        
        if user_input == "yes" || user_input == "Yes"
           FoodFinder::Buisness.all.clear
           call
        end
    end
end

