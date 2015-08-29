class ContactsController < ApplicationController
    def new
        @contact = Contact.new
        
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            flash[:success] = 'Message sent.'
            redirect_to new_contact_path
        else
            # Note: the success above and danger below are the Bootstrap alert colors.
            flash[:danger] = 'Error occured, message not sent.'
            redirect_to new_contact_path
        end
    end
    
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end