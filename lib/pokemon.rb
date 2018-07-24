class Pokemon

attr_accessor :id, :name, :type, :hp, :db


  def initialize (hash)
    hash.each { |key, value| self.send("#{key}=", value) }
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');")
  end

  def self.find(id, db)
    pokemon_finder = db.execute("SELECT * FROM pokemon WHERE id = #{id};").flatten

    Pokemon.new(id: pokemon_finder[0], name: "#{pokemon_finder[1]}", type: "#{pokemon_finder[2]}", hp: pokemon_finder[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = '#{hp}' WHERE name = '#{name}';")
  end

end
