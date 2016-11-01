class Antibiogram < ApplicationRecord
	has_many :susceptibilities
	has_many :drugs, :through => :susceptibilities
	has_many :specieses, :through => :susceptibilities

	def self.import(file)
		spreadsheet = open_spreadsheet(file)
#		header = spreadsheet.row(1)
#		(2..spreadsheet.last_row).each do |i|
#			row = Hash[[header, spreadsheet.row(i)].transpose]
#			product = find_by_id(row["id"]) || new
#			product.attributes = row.to_hash.slice(*accessible_attributes)
#			product.save!
#		end

#		spreadsheet.sheets.each do |sh|
			spreadsheet.each do |r|
				puts r.inspect
			end
#		end

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
