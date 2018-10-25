class Customer < ApplicationRecord


  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :first_name, :last_name, :phone

  # ElasticSearch Index
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :first_name, analyzer: 'english'
      indexes :last_name, analyzer: 'english'
      indexes :email, analyzer: 'english'
    end
  end

  def full_name
    myName = last_name.titleize + ", " + first_name.titleize
    myName ||= 'not provided'
  end
end
