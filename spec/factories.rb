# frozen_string_literal: true

require 'models/departure'
require 'models/note'

FactoryBot.define do
  factory :departure do
    city { 'VIENNA' }
    flight { 'OZ 7616' }
    time { '17:05' }
  end

  factory :note do
    departure
    temperature { 0 }
    text { "Let's run!" }
  end
end
