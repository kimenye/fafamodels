FAFAMODELS
==========
Base URL: http://fafamodels.herokuapp.com/

Login:
>>POST   /sessions.json

>>post :create, {email: "email@www.com", password: "password"}

>>response.body: "{\"user_id\":980190962,\"message\":\"You are logged in\",\"status\":\"success\"}"

>>response.body: “{\"message\":\"Email or password is invalid\",\"status\":\"unprocessable_entity\"}"


logout:

>>GET    /logout.json

>>delete :destroy

>>response.body "{\"message\":\"You are logged out\",\"status\":\"success\"}"

create user:

>>POST   /users.json

>>post :create, user: {}

>>required within user hash: user=>{:name, :email, :password, :date_of_birth, :gender_id, :phone_number}

>>>>name: “name”

>>>>email: "user6@email.com"

>>>>password: "password"

>>>>date_of_birth: "2014-04-14"

>>>>gender_id: 1 = male, 2 = female, 3 = Boy/Girl

>>>>phone_number: integer

>>response.body: "{\"user_id\":980191093,\"message\":\"User was successfully created\",\"status\":\"success\"}"

>>response.body: "{\"errors\":{\"name\":[\"can't be blank\"]},\"message\":\"User was not created\",\"status\":\"unprocessable_entity\"}"

update user:
>>PUT/PATCH    /users/:id.json

>>put :update, id: @user, user: {}

>>optional within user hash: user=>{:name, :email, :password, :date_of_birth, :gender_id, :phone_number}

>>response.body: "{\"message\":\"User was successfully updated\",\"status\":\"success\"}"

>>response.body: "{\"message\":\"User was not updated\",\"status\":\"unprocessable_entity\"}"

delete user:
>>DELETE /users/:id.json

>>delete :destroy, id: @user

>>response.body: "{\"message\":\"User was successfully destroyed\",\"status\":\"success\"}"

update measurements:
>>PUT/PATCH    /measurements/:id.json

>>put :update, id: @user.id, measurement: {}

>>response.body: "{\"message\":\"Measurements were successfully updated\",\"status\":\"success\"}"

>>response.body: "{\"message\":\"Measurements were not updated\",\"status\":\"unprocessable_entity\"}"

add photo
>>POST   /photos.json

>>post :create, photo: {}

>>required within photo hash: photo=>{image: image}

>>response.body: "{\"user_id\":980191093,\"message\":\"Photo was successfully added\",\"status\":\"success\"}"

>>response.body: "{\"errors\":{},\"message\":\"Photo was not saved\",\"status\":\"unprocessable_entity\"}"