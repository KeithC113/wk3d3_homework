require('pg')

class SqlRunner

# =>  run the self function

# =>  default value
  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      db.prepare("query", sql)
# =>  holding on to the result from the method
      result = db.exec_prepared("query",values)
# => this ensure command will always run the command below
      ensure
        db.close() if db !=nil
    end
    return result
  end
end
