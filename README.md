## PostGrade
PostGrade is a web app allowing teachers to create assignments, view those assignments, edit and delete them. While creating an assignment teachers can select students to be assigned.

![Alt Text](app/assets/images/postgrade.gif?raw=true )

### Installation
* Clone this repo

* Install all the gems via 
   ``` 
    $bundle install
   ```
 * Migrate database via
    ```
    $rails db:migrate
   ```
 * Use seed data to view all features of the app.
     ```
    $rails db:seed
    ```
 * Start your server
     ```
    $rails server
   ```
 * visit local host in your browser localhost:    
  ``http://localhost:3000
    http://127.0.0.1:3000
  ```

### Usage
 - The application welcomes you with a login page. Please use seed data to access full functinality of the app. 
 - After login, teacher's dashboard will display all courses that they are registered. From there users can navigate to course info page or gradebook to add assignments, to view grades of students by each course, or to create /update/delete an assignment.

### Acknowledgement
Thanks [gifcap.dev](https://github.com/joaomoreno/gifcap) for the use of Gif maker.
Thanks [Canva](https://www.canva.com/) for the images.

### Author(s)
* [Hatice Karatay](https://github.com/haticekaratay)
### License 
* [MIT](https://github.com/haticekaratay/post-grade/blob/main/LICENSE)
