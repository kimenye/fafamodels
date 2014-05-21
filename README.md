FAFAMODELS
==========
Base URL: http://fafamodels.herokuapp.com/

hello:
>>GET /hello
>> response: "world"

create user:

>>POST   /users.json

>>post :create, user: {}

>>required within user hash: user=>{:name, :email, :gender}

>>>>name: “name”

>>>>email: "user6@email.com"

>>>>gender_id: 1 = male, 2 = female, 3 = kids

>>response.body: "{\"user_id\":980191093,\"message\":\"User was successfully created\",\"status\":\"success\"}"

>>response.body: "{\"errors\":{\"name\":[\"can't be blank\"]},\"message\":\"User was not created\",\"status\":\"unprocessable_entity\"}"

update user:
>>PUT/PATCH    /users/:id.json

>>put :update, id: user_id, user: {}

>>optional within user hash: user=>{:name, :email, :gender_id}

>>response.body: "{\"message\":\"User was successfully updated\",\"status\":\"success\"}"

>>response.body: "{\"message\":\"User was not updated\",\"status\":\"unprocessable_entity\"}"

delete user:
>>DELETE /users/:id.json

>>delete :destroy, id: user_id

>>response.body: "{\"message\":\"User was successfully destroyed\",\"status\":\"success\"}"

update measurements: THIS IS THE ONLY MEASUREMENTS METHOD - measurements are created with the user's creation, therefore only available for updating.

>>PUT/PATCH    /measurements/:id.json

>>put :update, id: user_id, measurement: {}

>>response.body: "{\"user_id\":980191093,\"message\":\"Measurements were successfully updated\",\"status\":\"success\"}"

>>response.body: "{\"message\":\"Measurements were not updated\",\"status\":\"unprocessable_entity\"}"

add photo
>>POST   /photos.json

>>post :create, photo: {}

>>required within photo hash: photo=>{user_id: user_id, image: image}

>>response.body: "{\"user_id\":980191093,\"message\":\"Photo was successfully added\",\"status\":\"success\"}"

>>response.body: "{\"errors\":{},\"message\":\"Photo was not saved\",\"status\":\"unprocessable_entity\"}"