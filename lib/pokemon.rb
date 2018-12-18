class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  def initialize (id: nil, name: nil, type: nil, db: nil, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    self.class.all << self
  end
  def self.all
    @@all
  end
  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  def self.find (id, db)
    name_type = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id).flatten
    pname = name_type[0]
    ptype = name_type[1]
    Pokemon.new(id: id, name: pname, type: ptype, db: db)
  end
end
