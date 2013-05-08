require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @attr = {
        :name => "Example User",
        :email => "user@example.com",
        :password => "changeme",
        :password_confirmation => "changeme"
    }
  end

  should 'create a new instance given a valid attribute' do
    User.create!(@attr)
  end

  should "require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))

    assert !no_email_user.valid?
  end

  should "accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))

      assert valid_email_user.valid?
    end
  end

  should "reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      assert !invalid_email_user.valid?
    end
  end

  should "reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)

    assert !user_with_duplicate_email.valid?
  end

  should "reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)

    assert !user_with_duplicate_email.valid?
  end


  context "passwords" do

    setup do
      @user = User.new(@attr)
    end

    should "have a password attribute" do
      assert @user.password.present?
    end

    should "have a password confirmation attribute" do
      assert @user.password_confirmation.present?
    end
  end

  context "password validations" do

    should "require a password" do
      user = User.new(@attr.merge(:password => "", :password_confirmation => ""))

      assert !user.valid?
    end

    should "require a matching password confirmation" do
      user = User.new(@attr.merge(:password_confirmation => "invalid"))

      assert !user.valid?
    end

    should "reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      user = User.new(hash)

      assert !user.valid?
    end

  end

  context "password encryption" do

    setup do
      @user = User.create!(@attr)
    end

    should "have an encrypted password attribute" do
      assert @user.encrypted_password.present?
    end

  end

end
