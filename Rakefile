# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require './tasks/database'

load 'active_record/railties/databases.rake'

RSpec::Core::RakeTask.new(:spec)

task default: :spec
