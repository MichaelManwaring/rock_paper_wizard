module ApplicationHelper
	def notify(channel, &block)
		puts "STarted"
		message = {:channel => channel, :data => capture(&block)}
		uri = URI.parse("http://localhost:9292/faye")
		Net::HTTP.post_form(uri, :message => message.to_json)
		puts "ENDED"
	end
end
