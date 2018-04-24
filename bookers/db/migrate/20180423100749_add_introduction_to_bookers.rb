class AddIntroductionToBookers < ActiveRecord::Migration[5.1]
  def change
    add_column :bookers, :introduction, :text
  end
end
