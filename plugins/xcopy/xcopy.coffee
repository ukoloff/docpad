path = require 'path'
ncp = require 'ncp'

module.exports = (BasePlugin) ->
  BasePlugin.extend
    name: "xcopy"

    writeAfter: ->
