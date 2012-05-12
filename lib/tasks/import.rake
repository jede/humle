namespace :import do
  desc "import beers"
  task :beers => :environment do
    importer = BeerImporter.new(File.open('data/Assortments.xml'), verbose: true)
    importer.import!
  end
end
