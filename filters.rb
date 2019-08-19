# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    match = @candidates.find{|candidate| candidate[:id] == id}
end
  
def experienced?(candidate)
    if candidate[:years_of_experience] >=2
        return true
    else 
        return false
    end
end
  
  def qualified_candidates(candidates)
    allQualified = []
    currentTime = Time.now
    

    for candidate in candidates 
        time_difference = (currentTime.to_i - candidate[:date_applied].to_time.to_i) / 86400
        if candidate[:years_of_experience] >= 2 && candidate[:github_points] >= 100 && (candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python') ) && candidate[:age] >= 17 && time_difference <= 15
            allQualified.push(candidate)
        end
    end
  end
  #candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  def ordered_by_qualifications(candidates)
    (candidates.sort! {|a, b|
      if a[:years_of_experience] == b[:years_of_experience]
        a[:github_points] <=> b[:github_points]
      else
        a[:years_of_experience] <=> b[:years_of_experience]
      end
    }).reverse
  end

  # More methods will go below


#   {
#     id: 5,
#     years_of_experience: 4,
#     github_points: 293,
#     languages: ['C', 'Ruby', 'Python', 'Clojure'],
#     date_applied: 5.days.ago.to_date,
#     age: 26
#   }