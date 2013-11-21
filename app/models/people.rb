class People < ActiveRecord::Base
  # attr_accessible :title, :body
	def self.search_people uid

		p = People.new
		response = Net::HTTP.get_response("graph.facebook.com","/#{uid}?fields=picture,name")
		person = JSON.parse(response.body)
		unless person["name"].nil?
			if People.find_by_uid(id).nil?
				count = count + 1
				p.uid = uid
				p.name = person["name"]
				p.picture = person["picture"]["data"]["url"]
				p.save!
				puts p.inspect
			end
		end
		p

	end
	
end
