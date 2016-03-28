path = require 'path'
webpack = require 'webpack'

values = (map)->
  v for k, v of map

module.exports = (BasePlugin) ->
  BasePlugin.extend
    name: "webpack"

    config:
      output:
        filename: '[name].js'
      module:
        loaders: values
          coffee:
            test: /[.]coffee$/
            loader: "coffee-loader"
        resolve:
          extensions: ["", ".js", ".coffee"]
      plugins: [
        new webpack.optimize.UglifyJsPlugin
        new webpack.optimize.OccurenceOrderPlugin
      ]
      environments:
        development:
          debug: true
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
      webpack config, (err, stats)->
        console.log "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWW", err
        docpad.log 'info', stats.toString colors: true
