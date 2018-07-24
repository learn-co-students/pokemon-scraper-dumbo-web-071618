require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

#{id: 1, name: "Pikachu", type: "electric", db: @db}

  def initialize(attributes) #instance
    @id = attributes[:id]
    @name = attributes[:name]
    @type = attributes[:type]
    @hp = attributes[:hp]
    @db = attributes[:db]
  end

  def self.save (name, type, db) #saves instance in database
      sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
      SQL
      db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    poke = db.execute(sql, id).flatten
    Pokemon.new({id: poke[0], name: poke[1], type: poke[2], hp: poke[3], db: @db})
    #binding.pry
  end

  def alter_hp(hp, db)
    #binding.pry
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?
    SQL
    db.execute(sql, hp, self.id)
  end
end
