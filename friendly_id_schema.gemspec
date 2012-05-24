Gem::Specification.new do |s|
  s.name         = 'friendly_id_schema'
  s.summary      = 'A Ruby Micro Gem for use FriendlyId with ActiveRecordSchema.'
  s.version      = '0.1.1'
  s.platform     = Gem::Platform::RUBY

  s.files        = %w(friendly_id_schema.rb)
  s.require_path = '.'

  s.author      = 'Maurizio Casimirri'
  s.email       = 'maurizio.cas@gmail.com'

  s.add_dependency "friendly_id", "~> 4.0.1"
  s.add_dependency "active_record_schema"
end