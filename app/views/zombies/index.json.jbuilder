json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :name, :graveyard, :day_of_death, :no_of_arms, :description
  json.url zombie_url(zombie, format: :json)
end
