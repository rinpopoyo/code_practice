class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |s|
      s.references :user, null: false
      s.string :skill_name, null: false

      s.timestamps null: false
    end
  end
end
