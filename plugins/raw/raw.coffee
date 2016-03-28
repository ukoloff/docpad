path = require 'path'
ncp = require 'ncp'

module.exports = (BasePlugin) ->
  BasePlugin.extend
    name: "raw"

    writeAfter: ->
      src = path.join @docpad.config.srcPath, 'raw'
      ncp src, @docpad.config.outPath
