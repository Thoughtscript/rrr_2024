class ExamplesController < ApplicationController
  # Interceptors, actions, and some config
  # CSRF disabled only for local testing!!!
  skip_before_action :verify_authenticity_token

  # View
  def index
    @examples = Example.all
    render :index
  end

  # GET /examples/all
  def list
    examples = Example.all
    render json: examples
  end

  # GET /examples/:id
  def getOne
    example = Example.find_by!(id: params[:id])
    render json: example
  end

  # POST /examples
  def create
    # use params even to extract info from body
    # https://guides.rubyonrails.org/action_controller_overview.html#json-parameters
    example = Example.create!(name: params[:name])
    render json: example
  end

  # PUT /examples/:id
  def update
    example = Example.update(params[:id], :name => params[:name])
    render json: example
  end

  # DELETE /examples/:id
  def delete
    example = Example.delete(id: params[:id])
    render json: example
  end


  ##################################################
  #                    SubExamples                 #
  ##################################################

  # DELETE /examples/:id/subexamples/:sid
  def deleteSubExample
    example = Example.find_by!(id: params[:id])
    subExample = SubExample.find_by!(id: params[:sid])
    example.sub_examples.delete(subExample) 
    # https://api.rubyonrails.org/v7.1.3.4/classes/ActiveRecord/Associations/CollectionProxy.html#method-i-delete
    render json: example.sub_examples
  end

  # POST /subexamples
  def createSubExample
    example = Example.find_by!(id: params[:example_id])
    example.sub_examples.create!(name: params[:name], example_id: params[:example_id])
    render json: example.sub_examples
  end

  # GET /examples/:id/subexamples
  def getSubExamples
    example = Example.find_by!(id: params[:id])
    render json: example.sub_examples
  end

   # GET /subexamples/:id
   def getSubExample
    subExample = SubExample.find_by!(id: params[:id])
    render json: subExample
  end

end