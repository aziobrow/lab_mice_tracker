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
    if is_float?(value)
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

      Mouse.create!(original_id: mouse[:id],
                    trisomic: clean_trisomic(mouse[:trisomic]),
                    protein_ug_per_ml: clean_protein(mouse[:protein_ug_per_ml]),
                    diet: clean_diet(mouse[:diet]),
                    color: clean_color(mouse[:color]),
                    sex: clean_gender(mouse[:sex]),
                    date_of_birth: mouse[:date_of_birth],
                    experiment_start_date: mouse[:experiment_start_date],
                    harvest_date: mouse[:harvest_date],
                    group_number: mouse[:group_number],
                    harvest_brain_temp: clean_brain_temp(mouse[:harvest_brain_temp]),
                    weight_in_grams: clean_weight(mouse[:weight_in_grams]),
                    status: 1
                  )
    end
  end

end
