const { environment } = require("@rails/webpacker");

const webpack = require("webpack");

// Popper.js is used across all pages, so register it as a Webpack plugin.
environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    Popper: ["popper.js", "default"],
  })
);

module.exports = environment;
