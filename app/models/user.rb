require_relative '../../db/database_connection'


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
    # @connect = database_connection
  end


  def self.create(name:, dob:, cob:, mob:, email:, password:)
    connect = database_connection
  
    check = connect.exec("SELECT * FROM users WHERE email = '#{email}';")
    
    if check.any? 
      raise "E-mail address already exists"
    else
      # encrypted_password = BCrypt::Password.create(password)
      result = connect.exec("INSERT INTO users(name, dob, cob, mob, email, password) VALUES ('#{name}', '#{dob}', '#{cob}', '#{mob}', '#{email}', '#{password}') RETURNING id, name, dob, cob, mob, email, password;")
      User.new(id: result[0]['id'], name: result[0]['name'], dob: result[0]['dob'], cob: result[0]['cob'], mob: result[0]['mob'], email: result[0]['email'], password: result[0]['password'])
    end
  end

  def self.login(email:, password:)
    connect = database_connection

    check = connect.exec("SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}';")
    return true if check.any?
  end

end