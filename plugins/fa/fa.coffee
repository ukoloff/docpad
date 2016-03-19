path = require 'path'
ncp = require 'ncp'

module.exports = (BasePlugin) ->
  BasePlugin.extend
    name: "fa"

    writeAfter: ->
      src = path.join require.resolve('font-awesome/package'), '..', 'fonts'
      dst = path.join  @docpad.config.outPath, 'fonts'
      ncp src, dst
