class ContactRequestsController < ApplicationController
  include ApplicationHelper
  before_action :set_contact_request, only: [:show, :edit, :update, :destroy]
  # before_action :check_admin, except: [:new]
  http_basic_authenticate_with name: "kim", password: "sant's secret", except: [:new]
  
  

  def index
    @contact_requests = ContactRequest.all.where(resolved: false)
  end

  def show
  end

  def new
    @contact_request = ContactRequest.new
  end

  def edit
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)

    respond_to do |format|
      if @contact_request.save
        @contact_request.update(resolved: false)
        format.html { redirect_to home_path, notice: 'Thank you. We will address your concerns shortly.' }
        format.json { render :root, status: :created, location: @contact_request }
      else
        format.html { render :new }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact_request.update(contact_request_params)
        format.html { redirect_to contact_requests_path, notice: 'Contact request was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_request }
      else
        format.html { render :edit }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @contact_request.destroy
    @contact_request.update(resolved: true)
    respond_to do |format|
      format.html { redirect_to contact_requests_url, notice: 'Contact request was successfully resolved.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contact_request
      @contact_request = ContactRequest.find(params[:id])
    end

    def contact_request_params
      params.require(:contact_request).permit(:name, :email, :phone, :subject, :text)
    end

    # def check_admin
    #   redirect_to home_path
    #   # true
    #   # return true if spree_current_user
    # end
end
