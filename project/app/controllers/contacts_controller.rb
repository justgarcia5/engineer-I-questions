class ContactsController < ApplicationController
   before_action :set_contact, only: [:destroy, :show ]

   def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone, :email)
  end
end
