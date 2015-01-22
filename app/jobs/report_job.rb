class ReportJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Report.generate
  end
end
