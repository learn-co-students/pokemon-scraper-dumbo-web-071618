class Pokemon
  attr_accessor :id,:name,:type,:db,:hp
  def initialize attributes
    attributes.each do |key,value|
      self.send(("#{key}="),value)
    end
  end

  # def initialize id:,name:,type:,db:,hp: nil
  #   @id,@name,@type,@db,@hp = id,name,type,db,hp
  # end

  def self.save name,type,db
    sql = <<-SQL
      INSERT INTO pokemon (name,type) VALUES (?,?)
    SQL

    db.execute sql,name,type
  end

  def self.find id,db
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL

    specs = db.execute(sql,id)[0]
    pokemon_hash = {id: specs[0],name: specs[1],type: specs[2],hp: specs[3], db:db}
    Pokemon.new pokemon_hash
  end

  def alter_hp new_hp,db
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?
    SQL

    db.execute sql,new_hp,self.id
  end
end
