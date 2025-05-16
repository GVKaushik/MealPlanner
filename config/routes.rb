Rails.application.routes.draw do
  
  # Routes for the Course resource:

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })
  
  # UPDATE
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

  # Routes for the Cuisine resource:

  # CREATE
  post("/insert_cuisine", { :controller => "cuisines", :action => "create" })
          
  # READ
  get("/cuisines", { :controller => "cuisines", :action => "index" })
  
  get("/cuisines/:path_id", { :controller => "cuisines", :action => "show" })
  
  # UPDATE
  
  post("/modify_cuisine/:path_id", { :controller => "cuisines", :action => "update" })
  
  # DELETE
  get("/delete_cuisine/:path_id", { :controller => "cuisines", :action => "destroy" })

  #------------------------------

  devise_for :users
  root "foodie#homepage"
  
  # Routes for homepages
  get("/",{:controller=>"foodie",:action=>"homepage"})
  get("/feed", { :controller => "foodie", :action => "feed" })
  
  # Routes for recipes

  # Ask questions to send to GPT
  get("/recipes", { :controller => "recipes", :action => "index" })
  
  # Display the recipe
  get("/recipes/:path_id", { :controller => "recipes", :action => "show" })

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
  
  
  
  
  # DELETE
  get("/delete_recipe/:path_id", { :controller => "recipes", :action => "destroy" })

  #------------------------------

  

  
end
