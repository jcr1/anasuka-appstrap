Router.configure 
  layoutTemplate: "layout"

Router.map ->
  @route "home",
    path: "/"
    after: ->
      Session.set 'url', "home"

  @route "questionaire",
    path: "/analysis"
    waitOn: ->
      Meteor.subscribe 'allQuestions'
      Meteor.subscribe 'allDatas'
    fastRender: true

  @route "dashboard",
    path: "/dashboard"

  @route 'whoarewe',
    path: "/whoarewe"
    after: ->
      Session.set 'url', "we"

  @route 'howweinvest',
    path: "/howweinvest"
    after: ->
      Session.set 'url', "invest"