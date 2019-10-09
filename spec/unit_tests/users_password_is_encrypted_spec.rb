describe '.create' do
  it 'hashes the password using BCrypt' do
    user = User.create(email: 'test@example.com', password: 'abc123')
    databaseEntry = User.find_by(email: 'test@example.com')
    expect(databaseEntry.password_digest).not_to eq('abc123')
  end
end
