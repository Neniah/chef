require 'test_helper'

class CocineroTest < ActiveSupport::TestCase
 
  def setup
    @cocinero = Cocinero.new(name: "jhon", email: 'jhon@mail.com')
  end

  test "cocinero should be valid" do 
    assert @cocinero.valid?
  end

  test "cocinero should be present" do
    @cocinero.name = " "
    assert_not @cocinero.valid?
  end

  test "cocinero name should not be too long" do
    @cocinero.name = "a" * 41
    assert_not @cocinero.valid?
  end

  test "cocinero name should not be too short" do
    @cocinero.name = "aa" 
    assert_not @cocinero.valid?
  end

  test "email should be present" do 
    @cocinero.email = " "
    assert_not @cocinero.valid?
  end

  test "email length should be within bounds" do
    @cocinero.email = "a" * 101 + "@mail.com"
    assert_not @cocinero.valid?
  end

  test "email address should be unique" do 
    dup_cocinero = @cocinero.dup 
    dup_cocinero.email = @cocinero.email.upcase
    @cocinero.save
    assert_not dup_cocinero.valid?
  end

  test "email validation should accept valid addresses" do

  end

  test "email validation should reject invalid addresses" do

  end
end
