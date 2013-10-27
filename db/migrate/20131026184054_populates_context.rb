class PopulatesContext < ActiveRecord::Migration
  def change
  	Context.create(:name => 'Polytics')
  	Context.create(:name => 'Sports')
  	Context.create(:name => 'Movies')
  	Context.create(:name => 'Music')
  	Context.create(:name => 'Television')
  end
end
