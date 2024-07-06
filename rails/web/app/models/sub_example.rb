class SubExample < ApplicationRecord
    attribute :name, :string

    # Does not need to be explicitly set
    # attribute :id, :integer
    # self.primary_key = :id

    # Does not need to be explicitly set
    # attribute :example_id, :integer
    belongs_to :example, class_name: "Example", inverse_of: :sub_examples

    validates :name, presence: true
end
