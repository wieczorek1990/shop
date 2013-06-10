# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'active_record/fixtures'
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "users")
User.find(1).add_role :admin
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "countries")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "producers")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "categories")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "deliveries")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "payment_methods")