ActiveAdmin.register Order do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :restaurant_id, :dish, :delivery_time, :delivery_date, :customer_phone, :customer_address, 
                :order_status
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
    column "Orders" do |order|
      order.restaurant.name
    end                     
    column :dish        
    column :delivery_time, :sortable => :delivery_time do |r|
      r.delivery_time.strftime('%H:%M')
    end           
    column :delivery_date             
    column :customer_phone             
    column :customer_address             
    column :order_status             
    actions                   
  end  

  form do |f|
    f.inputs "Order Details" do
      f.input :restaurant_id, as: :select, collection: Restaurant.all  
      f.input :dish
      f.input :delivery_time
      f.input :delivery_date
      f.input :customer_phone
      f.input :customer_address
      f.input :order_status, as: :select, collection: ["Ordered", "In Progress", "Delivered", "Undeliverable"]
    end
    f.actions
  end


end
