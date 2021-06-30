## PostGrade
PostGrade is a web app allowing teachers to create assignments, view those assignments, edit and delete them. While creating an assignment teachers can select students to be assigned.

![Alt Text](app/assets/images/postgrade.gif?raw=true "Features")


### Installation
* Clone this repo

* Install all the gems via 
   ``` 
     $bundle install
   ```
 * Migrate database
    ```
    $rails db:migrate
   ```
 * Use seed data for pre-existing users login, or login with Google. 
     ```
    $rails db:seed
    ```
 * Start your server
     ```
    $rails server
   ```
 * visit local host in your browser localhost:    
   http://localhost:9393/

### Author(s)
* Hatice Karatay ------ [GitHub -- Hatice Karatay](https://github.com/haticekaratay)
### License 
[MIT](https://github.com/haticekaratay/post-grade/blob/main/LICENSE)
