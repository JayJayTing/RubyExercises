# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'


## Your test code can go here
#puts(find(5))
#puts(experienced?(@candidates[0]));
puts(qualified_candidates(@candidates))
# binding.pry

#pp @candidates