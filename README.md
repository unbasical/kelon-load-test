# Description

In order to test the performance of kelon with parallel requests under different loads, this project runs a load test using [k6](https://docs.k6.io/docs/welcome).

### Test setup:

* **Database** (PostgreSQL) with the data model of our [example app store](https://github.com/Foundato/spring-vue-appstore).
    
    * 1 user with role ADMIN
    * 1000 users with role DEVELOPER
        * Each owning 10 Apps (-> resulting in 10.000 apps in total)
    * 1000 users with role USER
 
* **Kelon** running on port 8181 with some example regos
* **PgAdmin4** running on port 5555 (can be used to inspect the database)

### Test components:

* Each test iteration performes the following requests
    1. Get all apps
    2. Get one app
    3. Update an app owned by the user
    4. Update an app which is not owned by the user

### Test stages:

* Three stages are executed with different loads
    1. 4 virtual users firing requests for 30 seconds
    2. 10 virtual users firing requests for 1 minute and 30 seconds
    3. 1 virtual user firing requests for 20 seconds

# Setup

In order to run any load tests you have to fill the PostgreSQL-Database with initial data. Therefore a Node.js-project is present which has to be executed once after you clonded the repository:

```bash
# Start database in order to fill it with the iniaial-load
docker-compose up -d postgres

# Go to project inial-load
cd ./initial-load

# Install dependencies and run project
npm install
npm run start

# Return to projects root afterwards
cd ..
```

# Run the load test local

In order to run the load test on your local machine, you have to start all necessary components with the provided docker-compose.yml:

```bash
docker-compose up -d
```

Afterwards you can execute the loadtest with k6
```bash
# If you have k6 installed on your machine
k6 run script.js

# If don't have k6 installed (just use the docker image)
docker run -i loadimpact/k6 run - <script.js
```

Don't forget to stop your test environment when you are finished
```bash
docker-compose down
```