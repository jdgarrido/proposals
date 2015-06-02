class CreateProposals < ActiveRecord::Migration
  def change
  	create_table :proposals do |t|
  		t.string :title
  		t.integer :votes
  	end
  end
end
