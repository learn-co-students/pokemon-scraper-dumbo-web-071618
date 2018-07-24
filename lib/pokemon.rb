require 'pry'
class Pokemon

    attr_accessor :name, :type, :db, :hp
    attr_reader :id


    def initialize(id:, name:, type:, db:, hp: nil)
        @name = name
        @type = type
        @id = id
        @hp = hp
    end

    # def self.add_set_hp(db)
    #     sql = <<-SQL
    #         ALTER TABLE pokemon ADD hp INTEGER;
    #         UPDATE pokemon SET hp = 60;
    #     SQL
    #     db.execute(sql)
    # end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        # self.add_set_hp(db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?;
        SQL
        pok = db.execute(sql, id)
        pok = pok[0]
        #  binding.pry
        self.new(id: pok[0], name: pok[1], type: pok[2], hp: pok[3], db: db)
    end

    def alter_hp(hp, db)
        sql = <<-SQL
          UPDATE pokemon SET hp = ? WHERE id = ?;
        SQL
        db.execute(sql, hp, id)
    end
end
