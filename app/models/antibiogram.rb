class Antibiogram < ApplicationRecord
	has_many :isolates, :dependent => :destroy
	has_many :bacteria, :through => :isolates
	has_many :susceptibilities, :through => :isolates
	has_many :drugs, :through => :susceptibilities

	def self.import(file)
		spreadsheet = open_spreadsheet(file)
#		header = spreadsheet.row(1)
#		(2..spreadsheet.last_row).each do |i|
#			row = Hash[[header, spreadsheet.row(i)].transpose]
#			product = find_by_id(row["id"]) || new
#			product.attributes = row.to_hash.slice(*accessible_attributes)
#			product.save!
#		end

		antibiogram = Antibiogram.create( :name => file.original_filename )
		searching_for_drugs=true
		drug_names=[]
		spreadsheet.each do |row|
puts row.inspect
			if searching_for_drugs
				if row[3].present? and row[3] != '%'
					drug_names = row[2..-1]	#	skip first 2 columns
					searching_for_drugs=false
					next
				end
			else
#				break if row[0].blank?
				#	some spreadsheets have a blank line in the data cells so don't break.
				#	Skip if no bacteria name OR. OR. OR. isolate. (Not AND)
				next if row[0].blank? or row[1].blank?
				row_hash = Hash[[drug_names, row[2..-1]].transpose]	#	skip first 2 columns
				bacteria_name = row[0]
				isolate_value = row[1]

				bacterium = Bacterium.find_by_name(bacteria_name) || Bacterium.create(:name => bacteria_name)
				isolate = antibiogram.isolates.create!(
					:bacterium => bacterium,
					:value => isolate_value)

				drug_names.each do |name|
					next unless name.present?	#	drug name line can start with a couple blank cells
					next unless row_hash[name].present?	#	cell could be empty

					drug = Drug.find_by_name(name) || Drug.create(:name => name)
					puts "Create susceptibility #{bacteria_name}, #{isolate.value}, #{name}, #{row_hash[name]}"

					isolate.susceptibilities.create!(:drug => drug, :value => row_hash[name])

				end
			end
		end

	end

	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
#			when ".csv" then Csv.new(file.path, nil, :ignore)
#			when ".csv" then Roo::CSV.new(file.path)
			when ".csv" then Roo::Spreadsheet.open(file.path)
#			when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
			when ".xls" then Roo::Spreadsheet.open(file.path)
#			when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
			when ".xlsx" then Roo::Spreadsheet.open(file.path)
			else raise "Unknown file type: #{file.original_filename}"
		end
	end

end
