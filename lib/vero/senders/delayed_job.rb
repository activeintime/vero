require 'delayed_job'
require 'delayed_job_active_record' if defined?(ActiveRecord)
require 'delayed_job_mongoid' if defined?(Mongoid)

module Vero
  module Senders
    class DelayedJob
      def call(api_class, domain, options)
        response = ::Delayed::Job.enqueue api_class.new(domain, options)
        Vero::App.log(self, "method: #{api_class.name}, options: #{options.to_json}, response: delayed job queued")
        response
      rescue => e
        if e.message == "Could not find table 'delayed_jobs'"
          raise "To send ratings asynchronously, you must configure delayed_job. Run `rails generate delayed_job:active_record` then `rake db:migrate`."
        else
          raise e
        end
      end
    end
  end
end