guard :minitest do
  # watch /lib/ files
  watch(%r{^lib/(.+).rb$}) do |m|
    "test/#{m[1]}_test.rb"
  end

  # watch /test/ files
  watch(%r{^test/(.+).rb$}) do |m|
    "test/#{m[1]}.rb"
  end
end
