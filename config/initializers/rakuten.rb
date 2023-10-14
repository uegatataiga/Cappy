RakutenWebService.configure do |c|
  c.application_id = ENV['RWS_APPLICATION_ID']
  puts ENV['RWS_APPLICATION_ID']
  c.debug=true

end