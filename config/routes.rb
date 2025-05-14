Rails.application.routes.draw do
  
  devise_for :users
  root "foodie#homepage"
  
  get("/",{:controller=>"foodie",:action=>"homepage"})
  get("/recipes", { :controller => "recipes", :action => "index" })
  get("/feed", { :controller => "foodie", :action => "feed" })
  # Delete / check be
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

  #------------------------------

  # Routes for the Recipe resource:

         
  # READ
  
  
  get("/recipes/:path_id", { :controller => "recipes", :action => "show" })
  
  # UPDATE
  
  post("/modify_recipe/:path_id", { :controller => "recipes", :action => "update" })
  
  # DELETE
  get("/delete_recipe/:path_id", { :controller => "recipes", :action => "destroy" })

  #------------------------------

  

  
end
