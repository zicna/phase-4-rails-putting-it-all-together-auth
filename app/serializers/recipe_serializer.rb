class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :instruction, :minutes_to_complete
  has_one :user
end
