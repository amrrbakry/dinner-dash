class RemoveHstoreExtension < ActiveRecord::Migration[5.0]
  def change
    disable_extension "hstore"
  end
end
