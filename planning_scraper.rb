# frozen_string_literal: true

require 'uk_planning_scraper' # required all of the installed gems for use in this Ruby file
require 'pp' # gem that outputs information to the console. print wouldn't be sufficient for this amount of data
require 'scraperwiki' # not being used yet....leave it here anyway

module PlanningScraper 
    class Info
        def scrape_values
            defined_locations.each do |location| # .each method iterates through the array below and scrapes the authority being passed in
                pp UKPlanningScraper::Authority.named(location).decided_days(7).scrape # when completed, this will output to the console. TODO: output to file/database
                sleep 5 # quick break before moving onto the next one
            end
        end

        private 
        # scope is used within the `scrape_values` method, limit scope so that it cannot be called outside of the class
        def defined_locations
            # supported authorities can be found here: https://github.com/adrianshort/uk_planning_scraper/blob/master/lib/uk_planning_scraper/authorities.csv
            ['Bradford', 'Calderdale', 'Leeds', 'Wakefield'] # can add relevant locations easily here, in this format. Could store these values in a text file in the future?
        end
    end
end

west_yorkshire = PlanningScraper::Info.new #instantiate new class, Ruby-style
west_yorkshire.scrape_values #calls method from the above class to execute at run-time (in the Terminal)

# to run this file, type `ruby planning_scraper.rb` in the Terminal. N.B: For Windows users, use `Command Line with Ruby`