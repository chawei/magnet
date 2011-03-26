module LangMappingsHelper
  def display_location(result)
    if [nil, "(null)", 'N/A'].include? result.city
      return result.country
    else
      return result.city
    end
  end
end
