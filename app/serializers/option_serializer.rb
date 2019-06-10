class OptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :expiration, :price
end
