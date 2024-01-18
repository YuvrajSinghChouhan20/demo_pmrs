Sidekiq::Cron::Job.create(
  name: 'Check Rent Payment Job',
  cron: '0 0 0 * * *',
  class: 'GenerateMonthlyRentJob'
)
