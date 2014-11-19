class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
