
class Pokemon
  attr_accessor :hp, :name, :type, :db, :id

  def initialize (attributes)
    attributes.each do |key, value|
      self.send(("#{key}="), value)
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

    specs = db.execute(sql, id)[0]

    hash = {}
    hash[:id] = specs[0]
    hash[:name] = specs[1]
    hash[:type] = specs[2]
    hash[:db] = db
    hash[:hp] = specs[3]

    new_pokemon = Pokemon.new(hash)
  end

  def alter_hp(new_hp, db)
    current_id = self.id
    sql = <<-SQL
    UPDATE pokemon SET hp = ? WHERE  id = ?;
    SQL
    # binding.pry
    db.execute(sql, new_hp, current_id)
  end

end
