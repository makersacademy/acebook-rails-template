class User

  attr_reader :id, :name, :dob, :cob, :mob, :email, :password

  def initialize(id:, name:, dob:, cob:, mob:, email:, password:)
    @id = id
    @name = name
    @dob = dob
    @cob = cob
    @mob = mob
    @email = email
    @password = password
  end


  def self.create(name:, dob:, cob:, mob:, email:, password:)
    if ENV['RAILS_ENV'] == 'test'
      connect = PG.connect(dbname: "pgapp_test")
    else
      connect = PG.connect(dbname: "pgapp_development")
    end
    # check = connect.exect("SELECT * FROM users WHERE email = '#{email}';")
    # return if check.any?
    # encrypted_password = BCrypt::Password.create(password)
    result = connect.exec("INSERT INTO users(name, dob, cob, mob, email, password) VALUES ('#{name}', '#{dob}', '#{cob}', '#{mob}', '#{email}', '#{password}') RETURNING id, name, dob, cob, mob, email, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], dob: result[0]['dob'], cob: result[0]['cob'], mob: result[0]['mob'], email: result[0]['email'], password: result[0]['password'])
  end

end