class RemoveShitFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :status
    remove_column :articles, :title
  end
end
