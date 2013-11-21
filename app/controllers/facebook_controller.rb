require 'net/http'
require 'json'

class FacebookController < ApplicationController
  def search_people
		#uid = 100002734181687
		puts "start"
		uid = People.last.uid
		count = 0
		people = Array.new
		while true
			uid = uid - 1
			puts uid
			response = Net::HTTP.get_response("graph.facebook.com","/#{uid}?fields=picture,name")
			person = JSON.parse(response.body)
			puts "#{person.inspect}"
			if !person["name"].nil?
				if People.find_by_uid(uid).nil?
					count = count + 1

					p = People.new
					p.uid = uid
					p.name = person["name"]
					p.picture = person["picture"]["data"]["url"]
					p.locale = person["locale"]
					p.save!
					puts p.inspect
					people.push p
				end
			elsif !person["error"].nil?
				if(person["error"]["code"] == 4)
					puts "wait..."
					t1 = Time.now
					t2 = Time.now
					while(t2 - t1 < 60*10)
						t2 = Time.now
					end
				end
			end
		end 
		@people = people
	end
end
