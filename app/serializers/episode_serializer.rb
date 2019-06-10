class EpisodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :number, :name
end
