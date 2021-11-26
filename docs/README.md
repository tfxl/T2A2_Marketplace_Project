# Marketplace Project T2A2  
## Timothy Long
___

(R9) Url: surf-swap-21.herokuapp.com/  

(R10) Github Repository : https://github.com/tfxl/T2A2_Marketplace_Project  

&nbsp;  
## What are we trying to solve, and why (R7, R8)  
&nbsp;  

This application addresses a "market" where owners of surboards, and other related surf gear, may have items that are no longer required or wanted, however are happy to trade these items, rather than sell and buy others.  
&nbsp;  

Situations where this exists could be  

> Moving to a different area, where different surf conditions require different boards
> Becoming more of an advanced surfer, and wanting to swap boards with someone who has different requirements  

&nbsp;  

Or in the case of other types of gear, such as wetsuits  

> Children outgrowing their wetsuits, so swapping two kid sized wetsuits for a board  
  
&nbsp;  


This identifies the problem that surf gear, such as surfboards, can become obsolete if retained by an owner with no use. It also identifies that surfing gear can be expensive, and having the ability to swap something less used, for something required, addresses this. 

The reason for solving this is to make people's lives better, to encourage less waste (for instance, throwing out old gear) which proves beneficial to the environment, and to encourage community engagement, so that it can become an informal networking tool as well. 

While there are sometimes "Swap Meets" held, these tend to be multiple people arriving at a single location at a single time, and a "see what is available" concept. Here, the appliccation allows users to list their gear, at a variety of locations, choosing a time that is convenient for them, and allow others to see a multitude of listings that suit their own conditions before they make an offer. 

Additionally, this application focuses on privacy, where user listings, offers, surf gear records etc are only retained while required. There is no need to hold information that is not fundamental to the application, so there are no "soft deletes" and records are removed. In the case where future implementation may allow a "soft delete" it would only be for reversible functionality (example, accidentally deleted a surfboard profile) and would then be timed for "hard deletion" shortly afterwards. 

Further to this property, only first names are required, phone numbers are only given to other users on the event of an agreed Meetup, and while other users can view both all listings and all offers, they cannot view agreed Meetups. Regarding these meetups, locations are at Surf Life Saving Club locations, which feature at multiple locations around the coastline, and this removes the need for users to provide their actual addresses. 
&nbsp;  

## Description of the Application
&nbsp;  

**Purpose**  

As discussed in detail above, the purpose is to provide an application where users can list or offer to trade surf related gear, such as surfboards, to other users. 

**Functionality / Features**  

* Ability to view listings generally without sign up  
* Ability to view listings individually with sign up and make offers
* Ability to make listings as a registered user  
* Ability to match a listing with an offer and arrange a meetup 

* Additionally, there is authentication (Devise) and authorisation (Pundit) to ensure users stay within the designated bounds. 
* There is the ability to add multiple details to listings and offers via forms  
* Surf gear, such as surf boards, can be added to a user profile with details and a photo implemented through a form  
* There are validations in place to ensure all information required is provided  
* CRUD operations allow for automatic creation of various instances, for instance on successful listing/offer match, a meetup is automatically created, while deletion of listings allows for automated removal of all offers. 

**Sitemap**  

![sitemap](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Surf%20Swap%20Site%20Map.png?raw=true)

**Screenshots**

## Homepage
![homepage](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_homepage.png?raw=true)&nbsp; 

## Login
![login](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_login.png?raw=true)&nbsp; 

## See All Surf Boards
![See all surf boards](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_board_index.png?raw=true)&nbsp; 

## Create New Board (or Edit Board)
![Create New Board (or Edit Board)](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_new_edit_board.png?raw=true)&nbsp; 

## See All Listings
![See All Listings](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_listings_index.png?raw=true)&nbsp; 

## See Specific Listing
![See Specific Listing](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_listing_page.png?raw=true)&nbsp; 

## Make Offer or Edit
![Make Offer or Edit](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_offer_page.png?raw=true)&nbsp; 

## Make New Listing or Edit
![Make New Listing or Edit](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_new_listing.png?raw=true)&nbsp;  

## See Meetups 
![See Meetups](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/web_meetup_index.png?raw=true)&nbsp; 



**Target Audience**
This is application is suitable for people with an interest in surfing, or utilising surf related gear (for instance, when additional items are implemented, such as wetsuits, these can be utilised in additional activities outside of surfing). While age is not an enforced parameter, or one that is taken, the demographic is primarily aimed for adults, although parents may decide to trade their children's gear in cases where it is outgrown or not used. 

**Tech Stack**

This includes 
* Ruby on Rails (with Ruby coding)  
* Postgres database 
* HTML  
* CSS inline and via Bootstrap  
* Cloudinary as CDN  
* Heroku for deployment  

&nbsp;  

## User Stories (R12) 

 From those that want to list their boards

```
 " I want to be able to easily list my board to swap, and see what the offers are, but I want to have control over which offer I want to accept or not "
```

```
 " I would like to be able to list more than one item at a time, so that I can sway, say, 3 boards at the same time " 
```

```
 " I would like to be able to hedge-my-bets and list all my items as a pack, but also list my items individually "  
```

```
 " If I make a listing, I would like to retain control over the whereabouts, the time and confirming that the swap was successful "
```

```
 " I don't want to give out my contact details unless I actually agree to a swap "
```

 From those that want to make offers

```
 " I would like to see all the listings and choose from those that interest me "
```

```
 " I want to know all the relevant details of a listing before making an offer "
```

```
 " I don't want my contact details known unless I make an offer which is going to be accepted "
```

```
 " I don't want the person listing to change their listing details and still be able to accept my original offer "
```

 From all users 

```
 " I want something that is easy to use, looks nice, and automatically takes care of a lot of the processes"
```

&nbsp;  

## The planning (ERD and Wireframes) (R13, R14)
&nbsp;  


### Surf Swap ERD  
&nbsp;  

![Surf Swap ERD](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Marketplace%20App.png?raw=true)&nbsp;  

&nbsp;  
### Surf Swap Wireframes  
&nbsp;  



![Wireframe 1](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2001.png?raw=true)&nbsp;  

![Wireframe 2](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2002.png?raw=true)&nbsp; 

![Wireframe 3](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2003.png?raw=true)&nbsp; 

![Wireframe 4](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2004.png?raw=true)&nbsp; 

![Wireframe 5](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2005.png?raw=true)&nbsp; 

![Wireframe 6](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2006.png?raw=true)&nbsp; 

![Wireframe 7](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2007.png?raw=true)&nbsp; 

![Wireframe 8](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2008.png?raw=true)&nbsp; 

![Wireframe 9](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2009.png?raw=true)&nbsp; 

![Wireframe 10](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Wireframe%2010.png?raw=true)&nbsp; 

&nbsp;  
&nbsp; 
# Conceptual Level Abstractions  

**User**  

The application can arguably work from Users or Boards at the current setup, but certainly makes more sense to feature Users as the primary model, especially with expansion to different types of surf related items, which will have their own attributes.  

Users will have to provide minimal details, such as an email address for authentication, along with a password. They will only need to provide a first name for privacy reasons, and a phone number for exchange on a successful listing and offer match.

Users will own boards, and can have many or none (although the latter will be required if they wish to engage in trading). They have the option to create listings and offers, although they do not have to. The only way they can participate in a Meetup is if there is a successful listing and offer combination, of which they are a part of. 

**Board**

This is the main item for swapping, so includes the ability to upload a picture. Every board must have an owner (one of the users), and might be part of a listing or offer, but do not have to be. It is important to note that a Board can be featured in multiple listings (for instance, as a single item, or as part of a group of items), and can be offered to numerous listings, giving users some additional flexibility. The attribute of status allows some tracking of the board, particularly if it is part of a meetup, so as to not be available for other actions while the swap is agreed upon. 

**Listing**  

These require multiple details, including the user, the items being listed, and the address. Without these, a listing cannot exist. A listing is able to have many offers, or none, and will have a single Meetup, or none. 

**Addresses**  

These are the locations of the Surf Life Saving Club proposed meetup places. These are not edited by users, which abides by the application design where personal addresses are not given out, and these clubs are at numerous locations around the country. Every address requires a postcode, and will be part of a Listing. Meetups do not need an address specifically, but in practical terms will adopt the address of the Listing.

**Postcodes**  

This model is separate in order to follow Normal Form guidance, separating from the Addresses. While it is perhaps not critical at this stage of development, the early separation will prove beneficial in cases where many more addresses are added, such that addresses may begin to have the same postcodes

**Offer**  

Offers can only be made on a listing, and must include a board or boards. Offers are from users, so require a user to generate these. Each offer must belong to a particular listing. While the details could actually be duplicated and applicable to other listings, thus generating duplicate selections of data, the design is created so that an offer is connected to only one listing, allowing dependencies such as the deletion of a listing to remove that offer, but not other duplicate-appearing offers on other listings. 

**Meetup**  

This relies on the successful arrangement of a listing with an offer, and so requires both of these instances. It does not require a user per se, but does indirectly by the fact that a listing and an offer requires a user. Without a listing and an offer, a meetup cannot be formed. 

**BoardListing** and **BoardOffer**  

These join tables allow for multiple boards to be parts of multiple listings or multiple offers, even simultaneously. This gives users more flexibility, so they could potentially list their surfboard, while at the same time using it to make an offer on two other listings. The logic built into the app will remove other user listings or offers if they agree upon a swap using that board. 

&nbsp;  

## Third Party Services (R16)

The major third party services being used are  
* **Cloudify** as a Content Delivery Network. This is a free service that allows for the uploads of images, and subsequent display, to our application. It uses "Environment as a Service" to manage the data, and our application has a unique connection with its allocated space.  

* **Heroku** is a platform as a service (PaaS) which allows the application to operate entirely in the cloud. It is a free service for the application of our size and requirements, and supports our Ruby programming language and Rails framework.


## Database Relations and the Implementation (R17, R18)

This is linked to some of the discussion in our conceptual level abstractions, however it can be noted that :

* Users optionally have many boards, while each board has only one owner (User). Thus users have a user_id which is their Primary Key, and Board uses this as a Foreign Key  

* Users have optionally many listings and also many offers, while both of these have only one User. Thus Listings and Offers have a foreign Key which links to the Primary Key of the user (the user_id)  

* An offer belongs to only one listing, while a listing can have many offers  

* While there is arguably data duplication (example, same offer is given to multiple listings) the actual identity of the offer is linked to the listing itself, meaning each offer actually belongs to only one listing. In this case, the Listing has an id which forms the Primary Key, and the Offer links to this via a Foreign Key  

* Multiple boards can be part of multiple listings, hence the need for a join table, creating one to many relationships to BoardListings  

* Multiple boards can be part of multiple offers, hence the need for a join table, creating one to many relationships to BoardOffers. Both of these join tables will link to the Primary Keys of the individual models, in this case, the Listing id and the Board id are both primary keys, featuring in the join table, linking the two entries. Likewise, the Offer id and Board id will be linked in the BoardOffers. The join tables take as foreign keys the primary keys of the models being joined.  

* Every meetup belongs to only one listing, and one offer. Future implementation will allow for multiple meetups to be arranged, so as to create options for multiple items, but it is not active at this stage. Here the Meetup thus has two Foreign Keys, being the Primary Keys of the Listing (id) and Offer (id) 

It can be noted here that the use of assigned surrogate keys as the Primary Keys ensures that they are unique, never changing, and never null, making them ideal for connecting models and also supporting referential integrity.

## Database Schema Design (R19)

This is largely covered by the R14 ERD design, and can be further examined by looking at the Rails Application schema.rb

```Ruby
ActiveRecord::Schema.define(version: 2021_11_14_035331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "website_main"
    t.string "website_menu"
    t.string "suburb"
    t.string "street_name"
    t.string "street_number"
    t.bigint "postcode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["postcode_id"], name: "index_addresses_on_postcode_id"
  end

  create_table "board_listings", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_board_listings_on_board_id"
    t.index ["listing_id"], name: "index_board_listings_on_listing_id"
  end

  create_table "board_offers", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_board_offers_on_board_id"
    t.index ["offer_id"], name: "index_board_offers_on_offer_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "designer", null: false
    t.integer "length"
    t.integer "width"
    t.integer "volume"
    t.string "condition"
    t.string "fins"
    t.string "tail"
    t.string "attachments"
    t.text "description"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "meetup_date"
    t.time "meetup_time"
    t.bigint "address_id", null: false
    t.string "header"
    t.string "status"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_listings_on_address_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "offer_id", null: false
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_meetups_on_listing_id"
    t.index ["offer_id"], name: "index_meetups_on_offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.text "comment"
    t.string "status", default: "being considered"
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_offers_on_listing_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "postcodes", force: :cascade do |t|
    t.integer "number"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "phone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "postcodes"
  add_foreign_key "board_listings", "boards"
  add_foreign_key "board_listings", "listings"
  add_foreign_key "board_offers", "boards"
  add_foreign_key "board_offers", "offers"
  add_foreign_key "boards", "users"
  add_foreign_key "listings", "addresses"
  add_foreign_key "listings", "users"
  add_foreign_key "meetups", "listings"
  add_foreign_key "meetups", "offers"
  add_foreign_key "offers", "listings"
  add_foreign_key "offers", "users"
end

```

&nbsp;  
&nbsp;  
## Allocation and Tracking of the project (R20)  

This project was another exploration of techniques and planning, with additional focus on the initial setup. Particularly after completing earlier projects where there was much "finding the way through", it was important to work out precisely what needed to be done.  

With this goal in mind, initial research and planning of the idea was completed. Within this, user stories could be imagined, and although these "user stories" changed over time, this may also reflect real life circumstances. Additional review of the lessons occurred in order to better grasp the techniques that would be required to implement this.  

From here, a lot of time was spent on the ERD, in order to better understand the project requirements. Wireframes were constructed to give an overall feel to the design to be implemented. Tasks were set in Trello to give an outline of the steps required. 

From this point onwards git commits allowed for version tracking, and there was additionally a lot of utilisation of notes and list in order to complete tasks. Given the new concepts, a lot of revision occurred regularly, as well as manual testing of the various aspects. Many occassions of code review were able to repair logic, and refine the user experience. 

![Trello Design ](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/trello_initial_design.png?raw=true)&nbsp;  

![Trello ToDo](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/trello_initial_todo.png?raw=true)&nbsp;  

![Trello Doing](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/trello_initial_design.png?raw=true)&nbsp;  

![Trello Completed 1](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/trello_completed_01.png?raw=true)&nbsp; 

![Trello Completed 2](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/trello_completed_02.png?raw=true)&nbsp; 

![Trello Completed 3](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/trello_completed_03.png?raw=true)&nbsp; 

![Trello Completed 4](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Trello_completed_04.png?raw=true)&nbsp; 

![Trello Completed 5](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Trello_completed_05.png?raw=true)&nbsp; 

![Trello Completed 6](https://github.com/tfxl/T2A2_Marketplace_Project/blob/main/docs/Trello_completed_06.png?raw=true)&nbsp; 

&nbsp;  
&nbsp;  

### Thank you