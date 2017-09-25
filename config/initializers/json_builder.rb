def json_builder(json, status, msg, *args)
  options = args.last.is_a?(Hash) ? args.pop : {}

  info               = ActiveSupport::OrderedHash.new
  info[:resp_status] = status
  info[:message]     = msg
  info[:errors]      = options[:errors]
  
  unless (json.to_s == "")
    data = { :data => json }
    hash = info.merge(data)
  else
    unless options[:tag_name].blank?
      data = { :data => { options[:tag_name] => "" } }.to_hash
    else
      data = { :data => "" }.to_hash
    end
    hash = info.merge(data)
  end
  puts hash.to_json
  return hash.to_json
end


  