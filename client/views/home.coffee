Template.home.rendered = ->
  ###
  Custom Javascript code for AppStrap Bootstrap theme
  Written by Themelize.me (http://themelize.me)
  ###

  #global jRespond 
  
  #colour switch - demo only
  # --------------------------------
  defaultColour = "blue"
  $(".colour-switcher a").click ->
    c = $(this).attr("href").replace("#", "")
    cacheBuster = 3 * Math.floor(Math.random() * 6)
    $(".colour-switcher a").removeClass "active"
    $(".colour-switcher a." + c).addClass "active"
    if c isnt defaultColour
      $("#colour-scheme").attr "href", "css/colour-" + c + ".css?x=" + cacheBuster
    else
      $("#colour-scheme").attr "href", "#"

  
  #IE placeholders
  # --------------------------------
  $("[placeholder]").focus(->
    input = $(this)
    if input.val() is input.attr("placeholder")
      if @originalType
        @type = @originalType
        delete @originalType
      input.val ""
      input.removeClass "placeholder"
  ).blur(->
    input = $(this)
    if input.val() is ""
      input.addClass "placeholder"
      input.val input.attr("placeholder")
  ).blur()
  
  # Detect Bootstrap fixed header
  # @see: http://getbootstrap.com/components/#navbar-fixed-top
  # --------------------------------
  $("html").addClass "has-navbar-fixed-top"  if $(".navbar-fixed-top").size() > 0
  
  # Bootstrap tooltip
  # @see: http://getbootstrap.com/javascript/#tooltips
  # --------------------------------
  # invoke by adding data-toggle="tooltip" to a tags (this makes it validate)
  if jQuery().tooltip
    $("body").tooltip
      selector: "[data-toggle=tooltip]"
      container: "body"

  
  # Bootstrap popover
  # @see: http://getbootstrap.com/javascript/#popovers
  # --------------------------------
  # invoke by adding data-toggle="popover" to a tags (this makes it validate)
  if jQuery().popover
    $("body").popover
      selector: "[data-toggle=popover]"
      container: "body"
      trigger: "hover"

  
  #allow any page element to set page class
  # --------------------------------  
  $("[data-page-class]").each ->
    $("html").addClass $(this).data("page-class")

  
  #show hide for hidden header
  # --------------------------------
  $("[data-toggle=show-hide]").each ->
    $(this).click ->
      state = "open" #assume target is closed & needs opening
      target = $(this).attr("data-target")
      targetState = $(this).attr("data-target-state")
      
      #allows trigger link to say target is open & should be closed
      state = targetState  if typeof targetState isnt "undefined" and targetState isnt false
      state = "open"  if state is "undefined"
      $(target).toggleClass "show-hide-" + state
      $(this).toggleClass state


  
  # #Plugin: jPanel Menu
  # # data-toggle=jpanel-menu must be present on .navbar-btn
  # # @todo - allow options to be passed via data- attr
  # # --------------------------------
  # if $.jPanelMenu and $("[data-toggle=jpanel-menu]").size() > 0
  #   jpanelMenuTrigger = $("[data-toggle=jpanel-menu]")
  #   jPM = $.jPanelMenu(
  #     menu: jpanelMenuTrigger.data("target")
  #     direction: "left"
  #     trigger: "." + jpanelMenuTrigger.attr("class")
  #     excludedPanelContent: ".jpanel-menu-exclude"
  #     openPosition: "280px"
  #     afterOpen: ->
  #       jpanelMenuTrigger.addClass "open"
  #       $("html").addClass "jpanel-menu-open"

  #     afterClose: ->
  #       jpanelMenuTrigger.removeClass "open"
  #       $("html").removeClass "jpanel-menu-open"
  #   )
    
  #   #jRespond settings
  #   jRes = jRespond([
  #     label: "small"
  #     enter: 0
  #     exit: 1010
  #   ])
    
  #   #turn jPanel Menu on/off as needed
  #   jRes.addFunc
  #     breakpoint: "small"
  #     enter: ->
  #       jPM.on()

  #     exit: ->
  #       jPM.off()

  
  #Plugin: clingify (sticky navbar)
  # --------------------------------
  $("[data-toggle=clingify]").clingify breakpoint: 1010  if jQuery().clingify
  
  #Plugin: flexslider
  # --------------------------------
  $(".flexslider").each ->
    sliderSettings =
      animation: $(this).attr("data-transition")
      selector: ".slides > .slide"
      controlNav: true
      smoothHeight: true
      start: (slider) ->
        
        #hide all animated elements
        slider.find("[data-animate-in]").each ->
          $(this).css "visibility", "hidden"

        
        #slide backgrounds
        slider.find(".slide-bg").each ->
          $(this).css "background-image": "url(" + $(this).data("bg-img") + ")"
          $(this).css("visibility", "visible").addClass("animated").addClass $(this).data("animate-in")

        
        #animate in first slide
        slider.find(".slide").eq(1).find("[data-animate-in]").each ->
          $(this).css "visibility", "hidden"
          $(this).addClass $(this).data("animate-delay")  if $(this).data("animate-delay")
          $(this).addClass $(this).data("animate-duration")  if $(this).data("animate-duration")
          $(this).css("visibility", "visible").addClass("animated").addClass $(this).data("animate-in")
          $(this).one "webkitAnimationEnd oanimationend msAnimationEnd animationend", ->
            $(this).removeClass $(this).data("animate-in")



      before: (slider) ->
        slider.find(".slide-bg").each ->
          $(this).removeClass($(this).data("animate-in")).removeClass("animated").css "visibility", "hidden"

        
        #hide next animate element so it can animate in
        slider.find(".slide").eq(slider.animatingTo + 1).find("[data-animate-in]").each ->
          $(this).css "visibility", "hidden"


      after: (slider) ->
        
        #alert(slider.currentSlide);
        #hide animtaed elements so they can animate in again
        slider.find(".slide").find("[data-animate-in]").each ->
          $(this).css "visibility", "hidden"

        
        #animate in next slide
        slider.find(".slide").eq(slider.animatingTo + 1).find("[data-animate-in]").each ->
          $(this).addClass $(this).data("animate-delay")  if $(this).data("animate-delay")
          $(this).addClass $(this).data("animate-duration")  if $(this).data("animate-duration")
          $(this).css("visibility", "visible").addClass("animated").addClass $(this).data("animate-in")
          $(this).one "webkitAnimationEnd oanimationend msAnimationEnd animationend", ->
            $(this).removeClass $(this).data("animate-in")



    sliderNav = $(this).attr("data-slidernav")
    if sliderNav isnt "auto"
      sliderSettings = $.extend({}, sliderSettings,
        manualControls: sliderNav + " li a"
        controlsContainer: ".flexslider-wrapper"
      )
    $("html").addClass "has-flexslider"
    $(this).flexslider sliderSettings

  $(".flexslider").resize() #make sure height is right load assets loaded
  
  #Plugin: jQuery Quicksand plugin
  #@based on: http://www.evoluted.net/thinktank/web-development/jquery-quicksand-tutorial-filtering
  # --------------------------------
  $("[data-js=quicksand]").each ->
    quicksandTrigger = $(this).find($(this).data("quicksand-trigger"))
    quicksandTarget = $($(this).data("quicksand-target"))
    quicksandTargetData = quicksandTarget.clone()
    filterId = "all"
    filteredData = undefined
    quicksandTrigger.click (e) ->
      filterId = $(this).data("quicksand-fid")
      filteredData = ""
      quicksandTrigger.parents("li").removeClass "active"
      $(this).parents("li").addClass "active"
      if filterId is "all"
        filteredData = quicksandTargetData.find("[data-quicksand-id]")
      else
        filteredData = quicksandTargetData.find("[data-quicksand-tid=\"" + filterId + "\"]")
      quicksandTarget.quicksand(filteredData,
        duration: 600
        attribute: "data-quicksand-id"
        adjustWidth: "auto"
      ).addClass "quicksand-target"
      e.preventDefault()

Template.home.events
  "click #login-button": (e, t) ->
    console.log 'click!'
    Router.go('/dashboard')
    $('body').removeClass('modal-open')
    $('.modal-backdrop').remove()

Template.footer.events
  'click #go': (e, t) ->
    email_address = $('#email-field').val()
    
    console.log email_address, 'go!'
    $('#confirm').modal()
    t.find('#email-field').value = ''

    Meteor.call('sendEmail', email_address)
  
    Emails.insert
      email: email_address
