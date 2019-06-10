class Library < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :option, optional: false
  has_one :catalogue, through: :option, class_name: :Catalogue

  validate :unique_catalogue_at_time

  def self.alive
    where(alive: true)
  end

  def set_expired
    update(alive: false)
  end

  private

  def unique_catalogue_at_time
    user_library = user.presence && user.libraries
                                        .joins(:catalogue)
                                        .where(catalogues: { id: option&.catalogue_id })
                                        .where(alive: true)

    errors.add(:option, :invalid, message: 'already bought') if user_library.any?
  end
end
