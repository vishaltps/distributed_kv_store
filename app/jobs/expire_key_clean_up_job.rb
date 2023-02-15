class ExpireKeyCleanUpJob
  include Sidekiq::Job

  def perform
    logger.info 'Performing batch clean up for expired keys...'
  	begin
			result = ActiveRecord::Base.connection.execute("DELETE from stores where ttl <= extract(epoch from ((now() at time zone 'UTC')))")
		rescue StandardError => e
			Rails.logger.error 'Error occured while batch clean up'
			Rails.logger.error (["#{self.class} - #{e.class}: #{e.message}"]+e.backtrace).join("\n")
		end
  end
end
