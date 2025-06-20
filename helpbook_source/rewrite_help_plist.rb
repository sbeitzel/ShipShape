require 'plist'

def rewrite_bundle_identifier(plist_path, new_bundle_identifier)
  begin
    plist = Plist.parse_xml(plist_path)
    plist['CFBundleIdentifier'] = new_bundle_identifier

    xml_string = plist.to_plist
    File.write(plist_path, xml_string, mode: "w")

    puts "Bundle Identifier updated to '#{new_bundle_identifier}' in '#{plist_path}'"

  rescue Errno::ENOENT
    puts "Error: File '#{plist_path}' not found."
  rescue => e
    puts "An error occurred: #{e.message}"
  end
end

def get_local_identifier
    file = File.open("../Configuration/Local.xcconfig", 'r')

    local_id = ""

    file.each_line do |line|
      next if line.strip.empty?

      parts = line.split('=')

      if parts.size >= 2 && parts[0].strip == "PRODUCT_BUNDLE_IDENTIFIER"
        local_id = parts[1].strip
      end

    end

    file.close
    return local_id
end

new_bundle_identifier = get_local_identifier + ".help"
rewrite_bundle_identifier('ShipShape_(main).help/Contents/Info.plist', new_bundle_identifier)
