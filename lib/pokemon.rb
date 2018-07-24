class Pokemon
  
   # The find method should create a new Pokemon object with an id, type, name AND hp after selecting their row from the database by their id number.
      # remember to also update the initialize method to accept an argument of hp that defaults to nil if not set (so it still passes the non-bonus tests)

 attr_accessor :name, :type, :id, :db,  :hp
 
 def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name 
    @type = type
    @db = db
    @hp = hp 
    
 end 
 
 
 def self.save(name,type,db) 
   sql  = "INSERT INTO pokemon(name,type) VALUES(?,?);"
   db.execute(sql, name, type)
   
 end
 
 def self.find(id,db)
   sql  = "SELECT * FROM pokemon WHERE pokemon.id = ?;"
    ans = db.execute(sql,id)
    ans = ans.flatten
    pokey = Pokemon.new(id: ans[0], name: ans[1], type: ans[2], db: db, 
    hp: ans[3])
    return pokey
   
   
   
 end
 
 def alter_hp(hp,db)
   
   sql  =  "UPDATE pokemon SET hp = ? WHERE pokemon.id= #{self.id};"
   poke = db.execute(sql,hp)
   #binding.pry 
  pokey = Pokemon.find(self.id,db)
  
 end
 
 end


