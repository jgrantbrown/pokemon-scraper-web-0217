require 'pry'
class Pokemon
 attr_reader :name,:type,:db, :id

  def initialize (id = nil, name = nil, type=nil, db=nil)
    @name = name
    @type = type
    @db = db
    @id = id
    #binding.pry
  end

  def self.save(name,type,db)

    db.execute("INSERT INTO pokemon(name,type) VALUES (?,?)",name,type)
  end

  def self.find(id,db)
   value = db.execute("SELECT name,type
                FROM pokemon
                WHERE id = (?)",id).flatten;
# creation self.new = Pokemon.new
      new_pokemon = self.new(id =id,name=value[0],type=value[1],db=db)
# /\return
      new_pokemon
  end

end
