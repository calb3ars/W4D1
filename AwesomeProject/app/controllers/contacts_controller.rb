class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(user_id: params[:user_id])
    @user = User.where(id: params[:user_id]).first
    @shared_contacts = @user.contact_shares
    render json: {contacts: @contacts, shared_contacts: @shared_contacts}
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(id: params[:id])
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: @contact
  end


  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
