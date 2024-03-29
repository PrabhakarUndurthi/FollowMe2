require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  before { user = User.new(name: "myname1", email:"myname1@google.com") }

  subject { @user }

  it {should respond_to(:name)}
  it {should respond_to(:email)}

  #it {should be_valid}

  describe "when name is not present" do 
  	before{@user.name = ""}
  	it {should_not be_valid}
  end


  describe "when email is not present" do 
  	before{ @user.email =""}
  	it {should_not be_valid }
  end

 describe "when name is too long" do 
 	before { @user.name ="a" * 51 }
 	it {should_not be_valid }
   end


   describe "when email format is invalid" do 
   	it "should be invalid" do 
   		addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@baz.com]
   		addresses.each do |invalid_address|
   			@user.email = invalid_address
   			expect(@user).not_to be_valid
        end
       end
     end

