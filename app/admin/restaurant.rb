ActiveAdmin.register Restaurant do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :user_id, :name, :category, :address, :city, :country, :zip
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
    column "User" do |restaurant|
      restaurant.user
    end                     
    column :name        
    column :category  
    column :address             
    column :city             
    column :country             
    column :zip             
    actions                   
  end  

  form do |f|
    f.inputs "Restaurant Details" do
      f.input :user_id, as: :select, collection: User.all  
      f.input :name
      f.input :category
      f.input :address
      f.input :city
      f.input :country
      f.input :zip
    end
    f.actions
  end


end
