require 'bundler/inline'

gemfile true do
  source 'http://rubygems.org'
  gem 'bcrypt'
end


module Crud 
  
  require 'bcrypt'
  #hash for storing key and value
  users = 
  [
    {username: "fefe", password: "pass1"},
    {username: "karkora", password: "pass2"},
    {username: "3body", password: "pass3"}
  ]
  
  #This method takes a password as input and returns a bcrypt-hashed representation of that password. The bcrypt algorithm incorporates features like salting, adaptive hashing, and key stretching for enhanced security.
  def create_hash_digest(password)
    BCrypt::Password.create(password)
  end
  
  #This method takes a bcrypt-hashed password (or hash digest) as input and creates a BCrypt::Password object
  def varify_hash_digest(password)
    BCrypt::Password.new(password)
  end  
    
  
  #storing user passwords in a user hashed database
  def create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] =             create_hash_digest(user_record[:password])
    end
    list_of_users
  end  
  
  puts create_secure_users(users)  
end  
  
  


  
