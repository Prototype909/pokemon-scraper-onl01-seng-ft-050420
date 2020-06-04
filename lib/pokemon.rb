class Pokemon

  @@all = []

  attr_accessor :name, :type, :db
  attr_reader :id

  def initialized(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @all << self
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type)
    @id = DB[:conn].execute("SELECT * FROM pokemon")[0][0]
  end

  def self.Find(name, type)
    sql = "SELECT * FROM pokemon WHERE name = ?"
    result = DB[:conn].execute(sql, name, type)[0]
    Pokemon.new(result[0], result[1], result[2])
  end
end
