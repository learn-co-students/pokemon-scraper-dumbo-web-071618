class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(attributes)
    attributes.each do |attribute, value|
      self.send "#{attribute}=", value
    end
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?);
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?;
    SQL

    pokemon = db.execute(sql, id).flatten
    # binding.pry
    pokemon_object = Pokemon.new(id:pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def alter_hp(hp, db)

    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = #{self.id};
    SQL
    db.execute(sql, hp)

    self.hp
  end

end
