class Guide
    def initialize(path=nil)
    end

    def launch
        introduction
        conclusion
    end

    def introduction
      puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
      puts "This is an itneractive guide to help you find the food you crave.\n\n"
    end

    def conclusion
      puts "\n<<< Goosbye and Bon Appetit! >>>\n\n\n"
    end

end