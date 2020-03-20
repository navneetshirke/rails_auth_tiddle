# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
 before_action :configure_sign_up_params, only: [:create]

 def create
  build_resource(sign_up_params)
  if resource.save
    sign_up(resource_name, resource)
    render json: {user:resource, status: :created}
  else
    clean_up_passwords resource
    render json: { status: :unprocessable_entity, locals: { errors: resource.errors.full_messages }}
  end
end

private

def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
end

end
