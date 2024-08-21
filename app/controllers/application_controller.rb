class ApplicationController < ActionController::Base
  include ActionView::Helpers::NumberHelper
  helper_method :number_to_RU_currency

  def number_to_RU_currency(number)
    number_to_currency(number,
      unit: '₽',
      separator: "",
      delimiter: " ",
      format: "%n %u",
      precision: 0
    )
  end
end
