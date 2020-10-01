class AddHeadingToArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :heading, :text
  end
end
