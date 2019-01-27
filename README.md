# Elm SPA

A shy Elm SPA project.

## Personal Goals

Our goal with Elm SAP is to better understand the Elm language and ecosystem.

We are using the 0.19 Elm release, that have great improvements in how to create and maintain SPA aplications.

## Project Goals

The main purpouse of that project is to show ourselves that we can use Elm as our frontend main language.

That is the start phase of that project, but we intend to make this bigger, with at least a dozen of modules and pages.

The main specifications are:
 - an access page, with login, register and password recovery;
 - an user management page, where users can edit their personal data;
 - a CRUD of some information (we have not reached consensus about what is our main "product");
 - a home page showing about what is this site;

## How to use

That project is an example of how to implement SPA with Elm 0.19. Thus we have created an `Main.elm` module, where all the magic happens and some other modules extracted from that Main as it grows.
We are following the path shown on [The Life of a File](https://www.youtube.com/watch?v=XpDsk374LDE) video from Elm`s creator Evan Czaplicki on Elm Europe 2017.

### Dependencies

This project depends only of nodejs an npm. We encourage you to install this programs following their documentations.

- [nodejs](https://nodejs.org/en/download/)
- [npm](https://www.npmjs.com/get-npm)


### Installing

Clone this repository
```shell
git clone https://github.com/maicoqb/elm-spa
```

Now you need to install the dependencies
```shell
cd elm-spa
npm install
```

All the main commands of this project are mapped on `package.json` scripts area.

To start seeing the result of that project you need to compile files and serve the `index.html`.

### Development

In development we use the following command to start application and serve the `public` directory.
```shell
npm run watch-dev
```
This command will build Elm code, writing the result on `public/elm.js`, and then serving the `public/index.html` as main page of application.
This html file includes `elm.js` code and starts the application.

After that, the watcher will be waiting for any changes on `src` directory to recompile the code and rewrite the final `elm.js` file.

So we can run the watcher, start changing the code and refresh the browser to see the results. Pretty similar to `elm reactor` command.

### Production

This project has no intention to goes to production. Although we included a build command that compiles the elm code to js optimizing the result.
```shell
npm run build
```

Thereafter just serve the public page in any static server and your site will be up and running.
