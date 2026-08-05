active_record_migration_class = ActiveRecord::Migration.respond_to?(:current_version) ? ActiveRecord::Migration[4.2] : ActiveRecord::Migration

class RenameIsDisabledToIsActive < active_record_migration_class
  def self.up
    execute "UPDATE periodictasks SET is_disabled = NOT is_disabled"
    rename_column :periodictasks, :is_disabled, :is_active
    change_column_default :periodictasks, :is_active, true
  end

  def self.down
    rename_column :periodictasks, :is_active, :is_disabled
    execute "UPDATE periodictasks SET is_disabled = NOT is_disabled"
    change_column_default :periodictasks, :is_disabled, false
  end
end
