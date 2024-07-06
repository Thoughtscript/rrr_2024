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
    jsonBodyName = request[:name]
    example = Example.create!(:name => jsonBodyName)
    render json: example
  end

  # PUT /examples/:id
  def update
    jsonBodyName = request[:name]
    example = Example.update!(id: params[:id], :name => jsonBodyName)
    render json: example
  end

  # DELETE /examples/:id
  def delete
    example = Example.delete!(id: params[:id])
    render json: example
  end


  ##################################################
  #                    SubExamples                 #
  ##################################################

  # DELETE /examples/:id/subexamples/:sid
  def deleteSubExample
    example = Example.find_by!(id: params[:id])
    example.sub_examples.delete(SubExample.find(id: params[:sid])) 
    # https://api.rubyonrails.org/v7.1.3.4/classes/ActiveRecord/Associations/CollectionProxy.html#method-i-delete

    subExample = SubExample.delete!(id: params[:sid])
    render json: subExample
  end

  # POST /subexamples
  def createSubExample
    jsonBodyName = request[:name]
    jsonBodyExampleId = request[:id]
    subExample = SubExample.create!(:name => jsonBodyName, :example_id => jsonBodyExampleId)
    render json: subExample
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