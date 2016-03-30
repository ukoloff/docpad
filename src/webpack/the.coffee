$ = require 'jquery'
do ->
  @$ = @jQuery = $

require "bootstrap"

do ->
  @katex = require 'katex-all'
  @kar = require 'katex-all/dist/contrib/auto-render.min.js'
