require 'restaurant'

class Guide
    class Config
        @@actions = ["list", "find", "add", "quit"]
        def self.actions
            @@actions
        end
    end
    def initialize(path=nil)
        Restaurant.filepath = path
        if Restaurant.file_exists?
            puts "Found restaurant file."
        elsif Restaurant.create_file
            puts "Created restaurant file."
        else
            puts "Exiting.\n\n"
            exit!
        end
    end

    def launch
        introduction
        result = nil
        until result == :quit
          result = do_action(get_action)
        end
        conclusion
    end

    def get_action
        action = nil
        until Guide::Config.actions.include?(action)
          puts "\nActions:" + Guide::Config.actions.join(",") +"\n\n"
          print ">"
          user_response = gets.chomp
          action = user_response.downcase.strip
        end
        return action
    end

    def do_action(action)
        case action
        when "list"
            puts "Listing..."
        when "find"
            puts "Finding..."
        when "add"
            add
        when "quit"
            return :quit
        else
            puts "\nI don't understand that command.\n\n"
        end
    end

    def add
        puts "\nAdd a restaurant\n\n".upcase
        restaurant = Restaurant.new

        print "Restaurant name: "
        restaurant.name = gets.chomp.strip

        print "Cuisine type: "
        restaurant.cuisine = gets.chomp.strip

        print "Average price: "
        restaurant.price = gets.chomp.strip

        if restaurant.save
            puts "\nRestaurant Added\n\n"
        else
            puts "\nSave Error: Restaurant not added\n\n"
        end
    end

    def introduction
      puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
      puts "This is an itneractive guide to help you find the food you crave.\n\n"
    end

    def conclusion
      puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
    end

end