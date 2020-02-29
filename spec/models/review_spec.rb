require 'rails_helper'
require 'spec_helper'

RSpec.describe Review, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validation tests' do
    it { is_expected.to validate_inclusion_of(:rating).in_array([1,2,3,4,5]).with_message("Rating must be from 1 to 5.")}
  end

  describe 'associations' do
    it { should belong_to(:item) }
  end

  describe 'column_specification' do
    it { should have_db_column(:item_id).of_type(:integer) }
  end

end

# describe Post, 'validation' do
#   it { should ensure_length_of(:title).is_at_least(10) }
#   it { should ensure_length_of(:title).is_at_most(100) }
#   it { should validate_presence_of(:title) }
#   it { should validate_uniqueness_of(:title) }
#
#   it { should ensure_length_of(:body).is_at_least(20) }
#
#   it { should ensure_length_of(:status).is_at_most(20) }
#
#   it { should validate_presence_of(:category_id) }
# end
#
# describe Post, 'association' do
#   it { should have_many(:categorizations) }
#   it { should have_many(:categories).through(:categorizations) }
# end
#
# describe Post, 'column_specification' do
#   it { should have_db_column(:title).of_type(:string).with_options(length: { minimum: 10, maximum: 100 }, presence: true, uniqueness: true) }
#   it { should have_db_column(:body).of_type(:text).with_options(length: { minimum: 20, maximum: 200 }) }
#   it { should have_db_column(:status).of_type(:string).with_options(length: { minimum: 2, maximum: 20, presence: true }) }
#   it { should have_db_column(:category_id).of_type(:integer) }
#
#   it { should have_db_index(:title).unique(true) }
# end
