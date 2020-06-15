namespace :testcode do
  unless Rails.env.production?
    require 'rspec/core/rake_task'
    require 'rubocop/rake_task'
    require 'simplecov'

    desc 'Execute Rspec'
    RSpec::Core::RakeTask.new(:spec) do |tsk|
      tsk.rspec_opts = '--format p'
    end

    task :rubocop do
      require 'rubocop'
      cli = RuboCop::CLI.new
      cli.run(%w[--rails --auto-correct])
    end

    desc 'create Rspec coverage'
    task :coverage do
      ENV['COVERAGE'] = 'true'
    end
  end
end

task :testcode do
  %w[spec coverage rubocop].each { |task| Rake::Task["testcode:#{task}"].invoke }
end
