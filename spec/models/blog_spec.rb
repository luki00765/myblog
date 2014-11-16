require 'rails_helper'

RSpec.describe Blog, :type => :model do
  before :each do
    @blog = Blog.new name: 'Test Blog', subdomain: 'testblog'
  end
  
  it '#name should be a Test Blog' do
    expect(@blog.name).to eq('Test Blog')
  end
end
