class ContactsController < ApplicationController
  before_action :set_contact, only: [ :destroy, :update, :edit ]

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!")
    else
      @parameter = params[:search].downcase
      @results = Contact.all.where("lower(name) LIKE :search", "%#{@parameter}%")
    end
  end

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      flash[:success] = "Contact: #{@contact.name} was successfully created!"
      redirect_to contacts_path
    else
      render :new
    end
  end

  def destroy
    if @contact.destroy
      flash[:notice] = "Contact: #{@contact.name} was successfully deleted"
      redirect_to contacts_path
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path
    else
      render :edit
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone, :email)
  end
end
