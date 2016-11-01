class Antibiogram < ApplicationRecord
	has_many :susceptibilities
	has_many :drugs, :through => :susceptibilities
	has_many :bacteria, :through => :susceptibilities

	def self.import(file)
		spreadsheet = open_spreadsheet(file)
#		header = spreadsheet.row(1)
#		(2..spreadsheet.last_row).each do |i|
#			row = Hash[[header, spreadsheet.row(i)].transpose]
#			product = find_by_id(row["id"]) || new
#			product.attributes = row.to_hash.slice(*accessible_attributes)
#			product.save!
#		end

		searching_for_drugs=true
		drug_names=[]
		spreadsheet.each do |row|
			if searching_for_drugs
				if row[3].present? and row[3] != '%'
					drug_names = row
					searching_for_drugs=false
					next
				end
			else
#				break if row[0].blank?
				#	some spreadsheets have a blank line in the data cells so don't break.
				#	Skip if no bacteria name and isolate.
				next if row[0].blank? and row[1].blank?
				row_hash = Hash[[drug_names, row].transpose]
				bacteria_name = row[0]
				isolate = row[1]
				drug_names.each do |name|
					next unless name.present?	#	drug name line can start with a couple blank cells
					next unless row_hash[name].present?	#	cell could be empty


					drug = Drug.find_by_name(name) || Drug.create(:name => name)
					puts "Create susceptibility #{bacteria_name}, #{isolate}, #{name}, #{row_hash[name]}"




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
