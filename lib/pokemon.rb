require 'pry'
class Pokemon

  #
#   attr_accessor :id, :name, :type, :db
#
#   def initialize(id)
#     @id = id
#     @name = name
#     @type = type
#     @db = db
#   end
#
#   def self.save(name, type, db)
#     sql = <<-SQL
#       INSERT INTO pokemon (name, type)
#       VALUES (?, ?);
#     SQL
#
#     db.execute(sql, [name,type])
# end
#
#
#   def self.find(id, db)
#     sql = "SELECT * FROM pokemon WHERE id = ?"
#     result = db.execute(sql, id)[0]
#     Pokemon.new(result[1],result[2], result[3])
#   end
attr_accessor :id, :name, :type, :db

  #  def initialize(id,)
  #    @id = id
  #    @name = name
  #   @type = type
  #    @db = db
  #   end

  def self.save(name, type, db)
sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
  SQL
  db.execute(sql, [name, type])
  @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id)
    Pokemon.new(result[0],result[1])
  end
end
