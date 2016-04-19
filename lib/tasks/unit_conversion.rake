namespace :unit_conversion do
  desc "convert all amounts to milligram"
  task :to_milligram, [:model] => [:environment] do |t, args|
    args[:model].constantize.to_milligram
  end
end
