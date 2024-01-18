Sidekiq::Cron::Job.create(
  name: 'Check Rent Payment Job',
  cron: '0 0 0 * * *',
  class: 'GenerateMonthlyRentJob'
)

# Use the provided Redis URL from Render
Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'], size: 12, network_timeout: 5 }
end
