"use strict";

const Bloggify = require("../lib");

// Start the app
let app = new Bloggify("path/to/your/app");

// After it's started, do something
app.onLoad(err => {
    console.log(`Bloggify running on port ${app._serverPort}`);
});
