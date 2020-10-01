class AddTagToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :tag, :string
    add_column :articles, :image, :string
    add_column :articles, :content, :text
    add_column :articles, :heading, :string
  end
end
