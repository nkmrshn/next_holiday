module ApplicationHelper
  def ga_account
    NextHoliday::Application.config.ga_account
  end

  def ga_domain_name
    NextHoliday::Application.config.ga_domain_name
  end
end
