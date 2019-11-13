# frozen_string_literal: true

require 'mysql2'
require 'active_record'
require 'yaml'

module Database
  module_function

  def init
    root = File.expand_path '../..', __dir__
    env = ENV['ENV'] || 'development'
    database_configuration = YAML.safe_load(File.read(File.join(root, 'config/database.yml')))

    ActiveRecord::Base.configurations = database_configuration
    ActiveRecord::Base.establish_connection env.to_sym
    if env == 'development'
      ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
    elsif env == 'test'
      # ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
    else
      ActiveRecord::Base.logger = ActiveSupport::Logger.new("log/db_#{env}.log", 'daily')
    end
  end
end
