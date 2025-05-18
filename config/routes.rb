Rails.application.routes.draw do

  devise_for :users
  root "foodie#homepage"

  # Routes for homepages
  get("/",{:controller=>"foodie",:action=>"homepage"})
  get("/feed", { :controller => "foodie", :action => "feed" })
  
  # Routes for recipes

  # Ask questions to send to GPT
  get("/recipes", { :controller => "recipes", :action => "index" })

  # Send to GPT

  post("/get_recipe",{:controller =>"recipes",:action=>"create"})
  
  # Display the recipe
  get("/recipes/:path_id", { :controller => "recipes", :action => "show" })

  
  # Delete / check below
  # Routes for the Review photo resource:

  # CREATE
  post("/insert_review_photo", { :controller => "review_photos", :action => "create" })
          
  # READ
  get("/review_photos", { :controller => "review_photos", :action => "index" })
  
  get("/review_photos/:path_id", { :controller => "review_photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_review_photo/:path_id", { :controller => "review_photos", :action => "update" })
  
  # DELETE
  get("/delete_review_photo/:path_id", { :controller => "review_photos", :action => "destroy" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  post("/insert_review", { :controller => "reviews", :action => "create" })
          
  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  
  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })
  
  # UPDATE
  
  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })
  
  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })

  

  
end
