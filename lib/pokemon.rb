require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(attributes={})
    attributes.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type) VALUES (?, ?);
      SELECT id, name, type FROM pokemon ORDER BY id DESC LIMIT 1;
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id == ?;
    SQL
    array = db.execute(sql, id)
    array = array.flatten
    hash = {:id => array[0], :name => array[1], :type => array[2], :hp => array[3], :db => db}
    pokemon = Pokemon.new(hash)
    # binding.pry
  end

  def alter_hp(hp, db)

    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id == ?;
    SQL
    db.execute(sql, hp, self.id)
  end

end
