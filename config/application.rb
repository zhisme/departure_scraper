# frozen_string_literal: true

require 'yaml'
require 'selenium/webdriver'
require 'capybara'
require 'dalli'
require_relative './initializers/database'

class Application
  DEFAULT_PROVIDER = 'viennaairport'

  attr_reader :config, :secrets, :env, :root, :memcache

  def self.init
    new.call
  end

  def call
    @config[:db] = Database.init
    @secrets = YAML.safe_load(File.read(File.join(root, 'config/secrets.yml')))[env]
    @memcache = Dalli::Client.new('localhost:11211', namespace: 'departure_scraper', compress: true)

    Capybara.default_driver = :selenium_chrome_headless

    self
  end

  def add_runtime_opts(opts)
    config.merge!(opts)
  end

  def rerun?
    !!config[:rerun]
  end

  def verbose?
    !!config[:verbose]
  end

  def provider
    config[:provider] || DEFAULT_PROVIDER
  end

  private

  def initialize
    @config = {}
    @env = ENV['ENV'] || 'development'
    @secrets = {}
    @root = File.expand_path '..', __dir__
  end
end
