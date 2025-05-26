file = File.open("Configuration/Local.xcconfig", 'r')

local_id = ""

file.each_line do |line|
  next if line.strip.empty?

  parts = line.split('=')

  if parts.size >= 2 && parts[0].strip == "PRODUCT_BUNDLE_IDENTIFIER"
    local_id = parts[1].strip
  end

end

file.close

helpbook_bundle = local_id + ".help"

lines = Array.new
file = File.open("helpbook_source/config_template.rb", 'r')
file.each_line do |line|
  parts = line.split('=')
  if parts.size >= 2 && parts[0].strip == ":CFBundleID"
    # do the substitution
    updated = parts[0] + '=> ' + helpbook_bundle + ",\n"
    lines.push(updated)
  else
    lines.push(line)
  end
end
file.close

# now, write the updated configuration
File.write("helpbook_source/config.rb", lines.join(""), mode: "w")
