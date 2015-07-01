require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron('0 * * * *') do
  Rails.logger.info "Run Source Synchronization at #{Time.now.utc}"
  SourceServices::Synchronize.new.call
  Rails.logger.info "Run Hourly Articles Synchronization at #{Time.now.utc}"
  ArticleServices::Synchronize.call(24.hours.ago, Time.now.utc)
end

scheduler.cron('0 0 * * *') do
  Rails.logger.info "Run Daily Articles Synchronization at #{Time.now.utc}"
  ArticleServices::Synchronize.call(1.month.ago, 24.hours.ago)
end

scheduler.cron('0 0 1 * *') do
  Rails.logger.info "Run Monthly Articles Synchronization at #{Time.now.utc}"
  ArticleServices::Synchronize.call(Time.new(2015, 01, 01), 1.month.ago)
end
