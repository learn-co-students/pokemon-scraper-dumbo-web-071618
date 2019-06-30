"SELECT * FROM pokemon WHERE id = id" #==> say this
"SELECT * FROM pokemon WHERE id = id" #==>this

name = "joe"
"SELECT * FROM pokemon WHERE name = #{name}" #==> say this
"SELECT * FROM pokemon WHERE id = 1" #==> this

id = "joe; DROP TABLE pokemon;"
"SELECT * FROM pokemon WHERE name = #{name}" #==> say this
"SELECT * FROM pokemon WHERE id = joe; DROP TABLE pokemon;" #==> this

id = 2
"SELECT * FROM pokemon WHERE name = ?" #==> why this
"SELECT * FROM pokemon WHERE name = #{id}" #==> and not this?

"SELECT * FROM pokemon WHERE name = 2" #==> why this
"SELECT * FROM pokemon WHERE name = 2" #==> and not this?

id = "joe; DROP TABLE pokemon;" ?("joe;")
"SELECT * FROM pokemon WHERE name = joe; DROP TABLE pokemon;" #==> will execute the command
"SELECT * FROM pokemon WHERE name = joe" #==> why this

def method(para = 0)
end



