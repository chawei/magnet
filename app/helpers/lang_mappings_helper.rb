module LangMappingsHelper
  def display_location(result)
    if [nil, "(null)", 'N/A'].include? result.city
      return Country.country_name_by_code(result.country)
    else
      return result.city
    end
  end
end
