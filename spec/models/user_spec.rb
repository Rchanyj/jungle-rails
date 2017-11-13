require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'an entry with a matching password and password_confirmation will save successfully' do
      @user = User.new(firstname: "Billay", lastname: "Bob", email: "asdf@asdf.com", password: "asdfas", password_confirmation: "asdfas")
      expect(@user.save).to be true
    end

    it 'an entry with mismatched password/confirm_password will not save' do
      @user = User.new(firstname: "Billay", lastname: "Bob", email: "asdf@asdf.com", password: "asdfas", password_confirmation: "safdsa")
      @user.save
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it 'an entry with blank password/confirm_password fields will not save' do
      @user = User.new(firstname: "Billay", lastname: "Bob", email: "asdf@asdf.com", password: nil, password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end

    it 'an entry with a blank password field will not save' do
      @user = User.new(firstname: "Billay", lastname: "Bob", email: "asdf@asdf.com", password: nil, password_confirmation: "asdfas")
      @user.save
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end

    it 'an entry with a blank confirm_password field will not save' do
      @user = User.new(firstname: "Billay", lastname: "Bob", email: "lala@lala.com", password: "asdfas", password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include ("Password confirmation can't be blank")
    end

    it 'should have a unique email (not case sensitive)' do
      User.create!(firstname: "Billay", lastname: "Bob", password: "asdfas", password_confirmation: "asdfas", email: "uniQUE@unique.com")
      @user = User.new(firstname: "Billay", lastname: "Bob", password: "asdfas", password_confirmation: "asdfas", email: "unique@unique.com")
      @user.save
      expect(@user.errors.full_messages).to include ("Email has already been taken")
    end

    it 'an entry with a blank firstname will not save' do
      @user = User.new(firstname: nil, lastname: "Bob", password: "asdfas", password_confirmation: "asdfas", email: "unique@unique.com")
      @user.save
      expect(@user.errors.full_messages).to include ("Firstname can't be blank")
    end

    it 'an entry with a blank lastname will not save' do
      @user = User.new(firstname: "Billay", lastname: nil, password: "asdfas", password_confirmation: "asdfas", email: "unique@unique.com")
      @user.save
      expect(@user.errors.full_messages).to include ("Lastname can't be blank")
    end

    it 'an entry with blank firstname and lastname fields will not save' do
      @user = User.new(firstname: nil, lastname: nil, password: "asdfas", password_confirmation: "asdfas", email: "unique@unique.com")
      @user.save
      expect(@user.errors.full_messages).to include ("Firstname can't be blank")
      expect(@user.errors.full_messages).to include ("Lastname can't be blank")
    end

    it 'an entry with a blank email will not save' do
      @user = User.new(firstname: "Bill", lastname: "Ted", password: "asdfas", password_confirmation: "asdfas", email: nil)
      @user.save
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it 'passwords less than the minimum (6) will not save' do
      @user = User.new(firstname: "Bill", lastname: "Ted", password: "asdf", password_confirmation: "asdf", email: "imim@mimi.com")
      @user.save
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
    end

  end
end





















