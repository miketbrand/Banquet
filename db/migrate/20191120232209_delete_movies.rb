class DeleteMovies < ActiveRecord::Migration
  def change
    drop_table :movies
  end
end
