class AdminUser < Upmin::Model
  form_attributes :email
  attributes      :email, :last_sign_in_at

  actions :update_password

  def update_password(new_password)
    object.password = new_password
  end
end