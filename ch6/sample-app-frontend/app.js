const express = require("express");

const backendHost = "http://sample-app-backend-service";

const app = express();
app.set("view engine", "ejs");

app.get("/", async (req, res) => {
  const response = await fetch(backendHost);
  const responseBody = await response.json();
  res.render("hello", { name: responseBody.text });
});

app.get("/name/:name", (req, res) => {
  res.render("hello", { name: req.params.name });
});

module.exports = app;
