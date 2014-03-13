if (Meteor.isClient) {
  Template.home.rendered = function () {
  $(document).ready(function(){"use strict";var e="green";$(".colour-switcher a").click(function(){var t=$(this).attr("href").replace("#",""),n=3*Math.floor(Math.random()*6);$(".colour-switcher a").removeClass("active");$(".colour-switcher a."+t).addClass("active");t!==e?$("#colour-scheme").attr("href","css/colour-"+t+".css?x="+n):$("#colour-scheme").attr("href","#")});$("[placeholder]").focus(function(){var e=$(this);if(e.val()===e.attr("placeholder")){if(this.originalType){this.type=this.originalType;delete this.originalType}e.val("");e.removeClass("placeholder")}}).blur(function(){var e=$(this);if(e.val()===""){e.addClass("placeholder");e.val(e.attr("placeholder"))}}).blur();$(".navbar-fixed-top").size()>0&&$("html").addClass("has-navbar-fixed-top");jQuery().tooltip&&$("body").tooltip({selector:"[data-toggle=tooltip]",container:"body"});jQuery().popover&&$("body").popover({selector:"[data-toggle=popover]",container:"body",trigger:"hover"});$("[data-page-class]").each(function(){$("html").addClass($(this).data("page-class"))});$("[data-toggle=show-hide]").each(function(){$(this).click(function(){var e="open",t=$(this).attr("data-target"),n=$(this).attr("data-target-state");typeof n!="undefined"&&n!==!1&&(e=n);e==="undefined"&&(e="open");$(t).toggleClass("show-hide-"+e);$(this).toggleClass(e)})});if($.jPanelMenu&&$("[data-toggle=jpanel-menu]").size()>0){var t=$("[data-toggle=jpanel-menu]"),n=$.jPanelMenu({menu:t.data("target"),direction:"left",trigger:"."+t.attr("class"),excludedPanelContent:".jpanel-menu-exclude",openPosition:"280px",afterOpen:function(){t.addClass("open");$("html").addClass("jpanel-menu-open")},afterClose:function(){t.removeClass("open");$("html").removeClass("jpanel-menu-open")}}),r=jRespond([{label:"small",enter:0,exit:1010}]);r.addFunc({breakpoint:"small",enter:function(){n.on()},exit:function(){n.off()}})}jQuery().clingify&&$("[data-toggle=clingify]").clingify({breakpoint:1010});$(".flexslider").each(function(){var e={animation:$(this).attr("data-transition"),selector:".slides > .slide",controlNav:!0,smoothHeight:!0,start:function(e){e.find("[data-animate-in]").each(function(){$(this).css("visibility","hidden")});e.find(".slide-bg").each(function(){$(this).css({"background-image":"url("+$(this).data("bg-img")+")"});$(this).css("visibility","visible").addClass("animated").addClass($(this).data("animate-in"))});e.find(".slide").eq(1).find("[data-animate-in]").each(function(){$(this).css("visibility","hidden");$(this).data("animate-delay")&&$(this).addClass($(this).data("animate-delay"));$(this).data("animate-duration")&&$(this).addClass($(this).data("animate-duration"));$(this).css("visibility","visible").addClass("animated").addClass($(this).data("animate-in"));$(this).one("webkitAnimationEnd oanimationend msAnimationEnd animationend",function(){$(this).removeClass($(this).data("animate-in"))})})},before:function(e){e.find(".slide-bg").each(function(){$(this).removeClass($(this).data("animate-in")).removeClass("animated").css("visibility","hidden")});e.find(".slide").eq(e.animatingTo+1).find("[data-animate-in]").each(function(){$(this).css("visibility","hidden")})},after:function(e){e.find(".slide").find("[data-animate-in]").each(function(){$(this).css("visibility","hidden")});e.find(".slide").eq(e.animatingTo+1).find("[data-animate-in]").each(function(){$(this).data("animate-delay")&&$(this).addClass($(this).data("animate-delay"));$(this).data("animate-duration")&&$(this).addClass($(this).data("animate-duration"));$(this).css("visibility","visible").addClass("animated").addClass($(this).data("animate-in"));$(this).one("webkitAnimationEnd oanimationend msAnimationEnd animationend",function(){$(this).removeClass($(this).data("animate-in"))})})}},t=$(this).attr("data-slidernav");t!=="auto"&&(e=$.extend({},e,{manualControls:t+" li a",controlsContainer:".flexslider-wrapper"}));$("html").addClass("has-flexslider");$(this).flexslider(e)});$(".flexslider").resize();$("[data-js=quicksand]").each(function(){var e=$(this).find($(this).data("quicksand-trigger")),t=$($(this).data("quicksand-target")),n=t.clone(),r="all",i;e.click(function(s){r=$(this).data("quicksand-fid");i="";e.parents("li").removeClass("active");$(this).parents("li").addClass("active");r==="all"?i=n.find("[data-quicksand-id]"):i=n.find('[data-quicksand-tid="'+r+'"]');t.quicksand(i,{duration:600,attribute:"data-quicksand-id",adjustWidth:"auto"}).addClass("quicksand-target");s.preventDefault()})})});
  };

  Template.hello.greeting = function () {
    return "Welcome to appstrap.";
  };

  Template.hello.events({
    'click input': function () {
      // template data, if any, is available in 'this'
      if (typeof console !== 'undefined')
        console.log("You pressed the button");
    }
  });
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    // code to run on server at startup
  });
}
