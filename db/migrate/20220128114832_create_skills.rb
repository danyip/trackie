class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :skill_type

      t.timestamps
    end
  end
end
