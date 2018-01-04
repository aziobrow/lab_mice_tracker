require 'csv'

class CSVReader

  attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def clean_trisomic(value)
    trisomic_value = value.downcase
    if trisomic_value == "yes"
      return true
    elsif trisomic_value == "no"
      return false
    else
      return nil
    end
  end

  def is_float?(value)
    true if Float(value) rescue false
  end

  def clean_protein(value)
    if is_float?(value)
      return value.to_f
    else
      return nil
    end
  end

  def clean_diet(value)
    diet_value = value.downcase
    if diet_value == 'rapa' || diet_value == "rapamycin"
      return "rapamycin"
    elsif diet_value == 'cont' || diet_value == "control"
      return "control"
    else
      return nil
    end
  end

  def clean_color(value)
    color_value = value.downcase
    if color_value == 'black' || color_value == 'agouti'
      return color_value
    else
      return nil
    end
  end

  def clean_gender(value)
    gender_value = value.downcase
    if gender_value == 'male' || gender_value == 'female'
      return gender_value
    else
      return nil
    end
  end

  def clean_brain_temp(value)
    if value == "CD"
      return value
    elsif is_float?(value)
      return value.to_f
    else
      return nil
    end
  end

  def clean_weight(value)
    if is_float?(value)
      return value.to_f
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
