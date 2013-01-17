group :backend do
  guard :bundler do
    watch('Gemfile')
  end

  guard :rspec, :cli => '--color --format doc' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})         { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^spec/models/.+\.rb$})   { ["spec/models", "spec/acceptance"] }
    watch(%r{^spec/.+\.rb$})          { `say hello` }
    watch('spec/spec_helper.rb')      { "spec" }
  end

  guard 'cucumber' do
    watch(%r{^features/.+\.feature$})
    watch(%r{^features/support/.+$})                      { 'features' }
    watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
  end
  
end

group :frontend do
  guard :coffeescript, :output => 'public/javascripts/compiled' do
    watch(%r{^app/coffeescripts/.+\.coffee$})
  end

  guard :livereload do
    watch(%r{^app/.+\.(erb|slim)$})
  end
end