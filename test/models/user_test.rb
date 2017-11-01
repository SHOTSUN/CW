require 'test_helper'

class UserTest < ActiveSupport::TestCase


  setup do
    @user = User.create(email: "email@gmail.ru" ,
                    password: "foobar", password_confirmation: "foobar")
  end

  teardown do
    @user.delete
  end


  test "user validation" do
    assert @user.valid?
  end

  test "model user should be valid" do
    assert(@user)
  end

  test "email must be" do
    assert(@user.respond_to?(:email))
  end

  test "when email is not present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "when email is too short" do
    @user.email = "em"
    assert_not @user.valid?
  end

  test "password must be" do
    assert(@user.respond_to?(:password))
  end

  test "password_confirmation must be" do
    assert(@user.respond_to?(:password_confirmation))
  end


  test "when password is not present" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "when password is too short" do
    @user.password = @user.password_confirmation = "12345"
    assert_not @user.valid?
  end

  test "when password doesn't match confirmation" do
    @user.password_confirmation = "5422"
    assert_not @user.valid?
  end

  test "when email format is invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        assert_not @user.valid?
      end
  end

  test "when email format is valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        assert @user.valid?
      end
  end

  test "when email address is already taken" do

    user_with_same_email = @user.dup
    assert_not user_with_same_email.valid?

  end

  test "when email with different registers address is already taken" do

    user_with_same_email = @user.dup
    user_with_same_email.email = @user.email.upcase
    assert_not user_with_same_email.valid?

  end

  test "email address with mixed case" do

    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal(@user.reload.email, mixed_case_email.downcase)

  end

end
