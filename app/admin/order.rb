ActiveAdmin.register Order do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :restaurant_id, :dish, :delivery_time, :delivery_date, :customer_phone, :customer_address, 
                :order_status, :appartment
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
    column "Restaurant" do |order|
      order.try(:restaurant).try(:name)
    end                     
    column :dish        
    column :delivery_time, :sortable => :delivery_time do |r|
      r.delivery_time.strftime('%H:%M')
    end           
    column :delivery_date             
    column :customer_phone             
    # column :appartment             
    # column :customer_address
    column :order_status             
    actions                   
  end  

  form do |f|
    f.inputs "Order Details" do
      f.input :restaurant_id, as: :select, collection: Restaurant.all  
      f.input :dish
      f.input :delivery_time, :as => :time_picker
      f.input :delivery_date, :as => :datepicker
      f.input :customer_phone
      f.input :appartment
      f.input :customer_address
      f.input :order_status, as: :select, collection: ["Ordered", "In Progress", "Delivered", "Undeliverable"]
    end
    f.actions
  end


  action_item :only => :index do
    link_to 'Import CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    Order.import(params[:dump][:file])
    flash[:notice] = "CSV imported successfully!"
    redirect_to :action => :index
  end

end
