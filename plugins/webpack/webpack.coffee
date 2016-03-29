path = require 'path'
webpack = require 'webpack'

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

    writeAfter: (opts, next)->
      docpad = @docpad
      cfg = docpad.getConfig()
      config = @getConfig()
      delete config.environments
      config.context = path.resolve cfg.srcPath, 'webpack'
      (config.output ||= {}).path = cfg.outPath

      webpack config
      .run (err, stats)->
        if err
          docpad.log 'error', "Webpack error: #{err}!"

        docpad.log 'info', stats.toString
          colors: true
          hash: false
          # timings: false
          assets: true
          chunks: false
          chunkModules: false
          modules: false
          children: true
        do next
