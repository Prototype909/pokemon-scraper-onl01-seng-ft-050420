class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    DB.EXECUTE("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

end
