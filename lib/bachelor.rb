require 'pry'

def get_first_name_of_season_winner(data, season)
  name = ""
  data.each do |season_num, info|
    if season_num == season
      info.each do |contestant_info|
        if contestant_info["status"] == "Winner"
          name = contestant_info["name"].split[0]
        end
      end
    end
  end
  name
end

def get_contestant_name(data, occupation)
  name = ""
  data.each do |season_num, info|
    info.each do |contestant_info|
      if contestant_info["occupation"] == occupation
        name = contestant_info["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_num, info|
    info.each do |contestant_info|
      if contestant_info["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  occupation = ""
  data.each do |season_num, info|
    info.each do |contestant_info|
      if contestant_info["hometown"] == hometown && occupation == ""
        occupation = contestant_info["occupation"]
      end
    end
  end
  occupation
end

def get_average_age_for_season(data, season)
  average_age = 0
  array = []
  data.each do |season_num, info|
    if season_num == season
      info.each do |contestant_info|
        array << contestant_info["age"].to_f
      end
      average_age = array.inject {|sum, num| sum + num}.to_f / array.length
    end
  end
  average_age.round
end
