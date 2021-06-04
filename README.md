# SoccerInfo:Microverse Rails Capstone Project

> A soccer micro-blogging platform where registered users can publish their opinions on footballing issues. Users can also upvote to control the content prioritization.

![Homepage](https://user-images.githubusercontent.com/38987207/120805218-7023bf80-c53d-11eb-97ca-67b422efd4bd.png)

## About This Project
Soccer Info is a micro-blogging platform for users who want to air their opinion on a wide range of footballing topics. All articles are grouped under categories and readers can upvote this articles. There is a featured article section on the homepage for the article with the most upvotes. Articles are grouped into selected categories and there is also a feature called Top Writer, a spotlight the Writer with the highest number of upvotes across their articles.

### Video Demo

https://user-images.githubusercontent.com/38987207/120813490-d44a8180-c545-11eb-9d15-2f783ac0af22.mp4

## Built With

- Ruby v3.0.0
- Ruby on Rails 6
- Bootstrap
- [Cloudinary](https://cloudinary.com/) - Media Asset Manager
- [Shrine](https://shrinerb.com/) - File Attachment Toolkit

## Live Demo

[Soccer Info](https://soccerinfo.herokuapp.com)

## Getting Started

To set up a local version of this project, a collection of steps have been put together to help guide you from installations to usage. Simply follow the guide below and you'll be up and running in no time.

### Set up Project

- Install [git](https://git-scm.com/downloads)
- Install [the Ruby programming language](https://ruby-doc.org/downloads/), if you haven't already.
- - Install [the Ruby on Rails MVC Framework](https://rubyonrails.org/), if you haven't already.
- Open Terminal
- Navigate to the preferred location/folder you want the app on your local machine. Use `cd <file-path>` for this.
- Run `git clone https://github.com/Moreneecoder/soccer-info.git` to download the project source code.
- Now that you have a local copy of the project, navigate to the root of the project folder from your terminal.
- Run `bundle install` to install all dependencies in the Gemfile file.

### Set up Database
- This project uses [postgresql](https://www.postgresql.org/download/), so ensure you have that installed first
- Run the commands below to create and migrate database
```
   rails db:create
   rails db:reset
   rails db:migrate
```

### Other Dependencies

- This project's user interface is built with [Bootstrap v5](https://getbootstrap.com/), run `yarn add boostrap` to simply set this up.
- Media assets (image storage and serving) for this project is handled by [Cloudinary](https://cloudinary.com/), to set this up, create an account and enter the details of your cloudinary api keys in the .env file as detailed further below.
- Create .env file in the project root directory to locally store/use your cloudinary APIs like so:
```
CLOUD_NAME=<YOUR_CLOUDINARY_NAME>
CLOUD_API_KEY=<YOUR_CLOUDINARY_API_KEY>
CLOUD_API_SECRET=<YOUR_CLOUDINARY_SECRET_KEY>
```

> 🗣 NOTE: All Cloudinary API information can be found in your cloudinary dashboard, under **_Account Details_**.

## Running Tests
- Rubocop: This is a tool for checking code quality and ensuring they meet the requirements. Microverse provides a wonderful setup guide for [rubocop here](https://github.com/microverseinc/linters-config/tree/master/ror).

- RSpec: This is a tool for testing the effectiveness of the program's logic at every step. To set up RSpec:
  - run `gem install rspec` in your terminal. This should install rspec globally on your local machine.
  - run `rspec --version`. This should display your rspec version if successfully installed.
  - run `rspec` to see passing and failing tests.

### Usage

- Start server with: `rails server`

- Open [http://localhost:3000/](http://localhost:3000/) in your browser.

### Deployment

While there are a couple of cloud services for deployment, it is recommended to use Heroku for deploying this project. Follow this [heroku official deployment guide](https://devcenter.heroku.com/articles/getting-started-with-rails6#deploy-your-application-to-heroku) to deploy your application to heroku.

## Authors

👤 **Bello Morenikeji Fuad**

- GitHub: [@moreenecoder](https://github.com/Moreneecoder)
- Twitter: [@mo_bello19](https://twitter.com/mo_bello19)
- LinkedIn: [Morenikeji Bello](https://linkedin.com/morenikeji-bello)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

[Microverse](https://microverse.org)

## 📝 License

This project is [MIT](./LICENSE) licensed.
