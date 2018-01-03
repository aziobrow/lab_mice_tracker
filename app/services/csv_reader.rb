require 'csv'

class CSVReader

  attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def to_boolean(value)
    trisomic_value = value.downcase
    if trisomic_value == "yes"
      return true
    elsif trisomic_value == "no"
      return false
    else
      return nil
    end
  end

  def csv_to_mice
    mice = (CSV.open"#{csv_file}", headers: true, header_converters: :symbol)

    count = 0
    mice.each do |mouse|
      puts "Mouse #{count} created"
      count += 1

      created = Mouse.create!(original_id: original_id,
                    trisomic: school[:name],
                    address: school[:address],
                    zip_code: school[:zipcode9],
                    phone: school[:phone],
                    principal: school[:principalname],
                    grade_levels: school[:gradelevels],
                    web_url: school[:web_url],
                    description: school[:schooltypedescription],
                    district: District.all.sample)
    end
  end

end
