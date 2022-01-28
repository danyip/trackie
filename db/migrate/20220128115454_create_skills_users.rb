class CreateSkillsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :skills_users do |t|
      t.integer :skill_id
      t.integer :user_id
    end
  end
end
