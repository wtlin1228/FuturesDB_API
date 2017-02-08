# frozen_string_literal: true
require 'rake/testtask'

task :default do
  puts `rake -T`
end

namespace :db do
  task :_setup do
    require 'sequel'
    require_relative 'init'
    Sequel.extension :migration
  end

  desc 'Run database migrations'
  task migrate: [:_setup] do
    puts "Migrating to latest for: #{ENV['RACK_ENV'] || 'development'}"
    Sequel::Migrator.run(DB, 'db/migrations')
  end

  desc 'Reset migrations (full rollback and migration)'
  task reset: [:_setup] do
    Sequel::Migrator.run(DB, 'db/migrations', target: 0)
    Sequel::Migrator.run(DB, 'db/migrations')
  end
end

namespace :spec do
  desc 'Run all spec'
  task all: [:clear, :Member_create_get, :Member_update, :Member_delete]

  task :clear do
    sh "ruby spec/clean_database_spec.rb"
  end

  task :Member_create_get do
    sh "ruby spec/member_create_get_spec.rb"
  end

  task :Member_update do
    sh "ruby spec/member_update_spec.rb"
  end

  task :Member_delete do
    sh "ruby spec/Member_delete_spec.rb"
  end
end