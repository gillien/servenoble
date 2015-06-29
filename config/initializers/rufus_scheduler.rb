require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1h' do
  Source::Synchronize.new.call
end
