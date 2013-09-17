window.JoshuaPaling =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new JoshuaPaling.Routers.OxGames()
    Backbone.history.start({ root: "/o-and-x" })

$(document).ready ->
  JoshuaPaling.initialize()
