
class Gossip
attr_accessor :gossip_author, :gossip_content

def initialize(gossip_author,gossip_content)
@gossip_author = gossip_author
@gossip_content = gossip_content
end 
    def save
        CSV.open('db/gossip.csv', 'a') do |csv|
          csv << [@gossip_author, @gossip_content]
        end
      end

 def self.all
 all_gossips = [] #on initialise un array vide
      
        CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
      
return all_gossips #on retourne un array rempli d'objets Gossip


def find(id) 
gossip = [] 
CSV.read("./db/gossip.csv").each_with_index do |row,index|
if id == index + 1 
gossip << Gossip.new(row[0],row[1])
break 
end 
end 
return gossip 
end 



end 
end 
