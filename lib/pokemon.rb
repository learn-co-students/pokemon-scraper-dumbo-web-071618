require 'pry'

class Pokemon
attr_accessor :id, :name, :type, :db, :hp

  def initialize(args)
    args.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)

    SQL
    db.execute(sql, name, type)
  end

  def self.find(id,db)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?;
    SQL
    found_pokemon = db.execute(sql, id)
    new_poke = found_pokemon.flatten
    Pokemon.new(id: new_poke[0], name: new_poke[1], type: new_poke[2], hp:new_poke[3])
  end

  def alter_hp(hp, db)
   sql = <<-SQL
   UPDATE pokemon SET hp = ?
   WHERE id == #{self.id}
   SQL
   db.execute(sql, hp)
  end

end
