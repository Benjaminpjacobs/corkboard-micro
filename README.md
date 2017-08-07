### Search Bar Micro Service

This application is an API running on Rails 5 with a Mongo database. It was built to server [this application](https://github.com/Benjaminpjacobs/corkboard/blob/master/README.md) by feeding search results asynchronously to the homepage search bar. It is a simple recepticle the holds all possible service search results and serves them up on every keystroke to the home page. 

Features of this api include the use of MongoDB instead of Postgresql. This choice was made both for the opportunity to experiment with an unfamiliar technology but also because the schemaless design of this NoSQL databse made development of this simple service fast and easy. Additionally because data integrity and consistency are not vital for this service, a more light weight option seemd appropriate.

Additionally, this API makes use of JavaScript Web Tokens for authorization and authentication when updated, creating and deleting records. When background jobs contact this API with a request, those requests are encoded in a JWT making all transactions between the two services secure. Please visit the [corkboard hompage](https://corkboard-services.herokuapp.com/) to see this service in action. 
