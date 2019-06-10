class ExpireLibraryWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    library.set_expired
  end
end
