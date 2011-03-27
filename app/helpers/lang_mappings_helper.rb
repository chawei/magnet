module LangMappingsHelper
  def display_location(result, with_country=false)
    if [nil, "(null)", 'N/A'].include? result.city
      return Country.country_name_by_code(result.country)
    else
      return (with_country ? "#{result.city}, #{result.country}" : result.city)
    end
  end
end
