ActiveAdmin.register Restaurant do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :phone, :categories, :address, :city, :state, :zip, :email, :email, :password, :password_confirmation
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  actions :all

  index do                                              
    column :name        
    column :email        
    column :phone
    column "Category" do |restaurant|
      restaurant.try(:categories).map{|cat| cat.name }.join(', ')
    end   
    column :address             
    column :city             
    column :state           
    column :zip             
    actions                   
  end  

  form do |f|
    f.inputs "Restaurant Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :categories, collection: Category.all, :input_html => { :class => "chosen-input form-control", style: "width: 50%", :multiple => true }
      f.input :phone;
      f.input :address
      f.input :city
      f.input :state, as: :select, collection: us_states
      f.input :zip
    end
    f.actions
  end


end
