require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://textanalysis-text-summarization.p.rapidapi.com/text-summarizer")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["x-rapidapi-host"] = 'textanalysis-text-summarization.p.rapidapi.com'
request["x-rapidapi-key"] = 'fa624fb4b1msh103e4232cccb573p12bb33jsn51ca86dff61a'
request["content-type"] = 'application/json'
request["accept"] = 'application/json'
request.body = "{  \"url\": \"http://en.wikipedia.org/wiki/Automatic_summarization\",  \"text\": \"\",  \"sentnum\": 8}"

response = http.request(request)
puts response.read_body