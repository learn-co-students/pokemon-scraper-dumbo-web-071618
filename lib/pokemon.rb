require 'pry'
class Pokemon

    attr_accessor :name, :type, :id, :db, :hp
    
    def initialize(id:, name:, type:, db: db, hp: 60)
       @id = id
       @name = name
       @type = type
       @hp = hp
    #    binding.pry
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?;
        SQL
        pok = db.execute(sql, id)[0]
        self.new(id: pok[0], name: pok[1], type: pok[2], hp: pok[3])
    end

    def alter_hp(hp, db)
        sql = <<-SQL
            UPDATE pokemon
            SET hp = ?
            WHERE id = ?
        SQL
        db.execute(sql, hp, self.id)
    end
end
