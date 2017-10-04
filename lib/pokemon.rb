require 'pry'
class Pokemon
 attr_reader :name,:type,:db,:id
 attr_accessor :hp
  def initialize (id:nil, name: nil, type: nil, db: nil, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    #binding.pry
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)",name,type)
  end

  def self.find(id, db)

   value = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
   
  # creation self.new = Pokemon.new
   new_pokemon=self.new(id: value[0], name: value[1], type: value[2], db: db,hp: value[3])

  end

  def alter_hp(new_hp, db)

    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)

  end

end
