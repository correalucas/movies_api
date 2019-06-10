class CatalogueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :category, :title, :plot

  has_many :episodes, if: Proc.new { |record| record.category == 'season' }
  has_many :options
end
