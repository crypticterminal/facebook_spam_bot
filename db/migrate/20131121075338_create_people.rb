class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
			t.integer		:uid,				:null => false
			t.string		:name, 			:null =>false
			t.string		:picture, 	:null =>false
			t.string		:locale, 	:null =>false
			t.boolean		:sended,		:default => false

      t.timestamps
    end
  end
end
