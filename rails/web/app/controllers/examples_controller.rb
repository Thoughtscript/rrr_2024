class ExamplesController < ApplicationController
  # Interceptors, actions, and some config
  # CSRF disabled only for local testing!!!
  skip_before_action :verify_authenticity_token

  # GET /examples
  def list
    examples = Example.all
    render json: examples
  end

  # GET /examples/:id
  def getOne
    example = Example.find_by!(id: params[:id])
    render json: example
  end

  # GET /examples/subexamples/:id
  def getSubExamples
    example = Example.find_by!(id: params[:id])
    render json: example.sub_example
  end

  # POST /examples
  def create
    jsonBodyName = request[:name]
    example = Example.create!(:name => jsonBodyName)
    render json: example
  end
end