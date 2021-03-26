# frozen_string_literal: true

require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format progress'
end

task :play, [:single_hand] do |_t, args|
  ruby "./bin/run #{args[:single_hand]}"
end

task default: :play
