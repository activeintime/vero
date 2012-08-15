require 'rails'

module Vero 
  autoload :Config,     'vero/config'
  autoload :App,        'vero/app'
  autoload :Context,    'vero/context'
  autoload :Trackable,  'vero/trackable'
  autoload :Sender,     'vero/sender'

  module API
    autoload :BaseAPI,  'vero/api/base_api'
    autoload :TrackAPI, 'vero/api/track_api'
  end

  module Utility
    autoload :Logger,   'vero/utility/logger'
  end
end

if defined? ActiveRecord
  require 'delayed_job_active_record'
end

if defined? Mongoid
  require 'delayed_job_mongoid'
end

require 'vero/railtie' if defined?(Rails)