class CreatePageBanners < ActiveRecord::Migration
  def self.up
    create_table :page_banners do |t|
      t.column :banner_id, :integer
      t.references :editable, :polymorphic => :true
      t.column :position, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :page_banners
  end
end
