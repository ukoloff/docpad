path = require 'path'
webpack = require 'webpack'

values = (map)->
  v for k, v of map

module.exports = (BasePlugin) ->
  BasePlugin.extend
    name: "webpack"

    config:
      module:
        loaders: values
          coffee:
            test: /[.]coffee$/
            loader: "coffee-loader"
        resolve:
          extensions: ["", ".js", ".coffee"]
      plugins: [new webpack.optimize.UglifyJsPlugin]
      environments:
        development:
          output:
            pathinfo: true
          plugins: []

    writeAfter: ->
      docpad = @docpad
      cfg = docpad.getConfig()
      config = @getConfig()
      delete config.environments
      config.context = path.resolve cfg.srcPath, 'webpack'
      (config.output ||= {}).path = cfg.outPath
      console.log ""
      console.log "@@@@@@@@@@@@@@@@@@@", config
