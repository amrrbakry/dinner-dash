module CartsHelper
  def find_value(value_id)
    Value.find_by(id: value_id)
  end
end
