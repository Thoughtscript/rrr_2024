class Example < ApplicationRecord
    # Remember that Rails ActiveRecord uses attributes here!
    # Distinct from DTO's.  
    attribute :name, :string

    # Does not need to be explicitly set
    # #attribute :id, :integer
    # self.primary_key = :id

    has_many :sub_examples, inverse_of: :example

    validates :name, presence: true

    def msg
      "Test Message!"
    end
end
