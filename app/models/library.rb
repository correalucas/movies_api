class Library < ApplicationRecord
  belongs_to :user
  belongs_to :option
  has_one :catalogue, through: :option, class_name: :Catalogue

  validate :unique_catalogue_at_time

  private

  def unique_catalogue_at_time
    user_library = user.libraries
                       .joins(:catalogue)
                       .where(catalogues: { id: option.catalogue_id })
                       .where(alive: true)

    errors.add(:option, :invalid, message: 'already bought') if user_library.any?
  end
end
