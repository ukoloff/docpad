path = require 'path'
webpack = require 'webpack'
{TaskGroup} = require 'taskgroup'

values = (map)->
  v for k, v of map

brk = (s)->
  s.split ' '

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
          litcoffee:
            test: /[.](litcoffee|coffee[.]md)$/
            loader: "coffee-loader?literate"
      resolve:
        extensions: brk " .js .coffee .litcoffee .coffee.md"
      plugins: values
        minimize: new webpack.optimize.UglifyJsPlugin
        reorder: new webpack.optimize.OccurenceOrderPlugin
      environments:
        development:
          debug: true
          devtool: 'cheap-source-map'
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
