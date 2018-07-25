class Pokemon

attr_accessor :id, :name,:type,:db, :hp

  def initialize(id:, name:, type:, db:,hp: 60)
    @hp = hp
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name,type,db)
    sql = <<-SQL
    INSERT INTO pokemon (name,type) VALUES(? , ?)
    SQL
    db.execute(sql,name,type)
  end

  def self.find(id,db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = #{id}
    SQL
    array = db.execute(sql).flatten

    Pokemon.new(id: array[0] ,name: array[1],type: array[2],hp: array[3]  ,db: SQLite3::Database.new('../pokemon.db') )
  end

  def alter_hp(hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE name = ?

    SQL

    db.execute(sql,hp, name)
  end

end

#CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT);
