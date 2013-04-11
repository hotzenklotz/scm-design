$(document).ready ->

  setup()

setup = ->

  $("body").noisy()
  window.currentContainer = $(".home")

  $(".home").css("transform", "translate(0%, 0%)")


  $("nav a").on "click", changeContainer



changeContainer = (evt) ->

  evt.preventDefault()

  newContainer = switch $(this).attr("href")
    when "home" then $(".home")
    when "about" then $(".about")
    when "work" then $(".work")
    when "contact" then $(".contact")


  unless newContainer.selector == window.currentContainer.selector
    fadeOut( ->
      window.currentContainer = newContainer
      fadeIn()
    )


fadeOut = (callback) ->

  container = window.currentContainer

  fadeOutWrapper = ->
    container.addClass("inactive")
    container.removeClass("active")
    container.css("transform", "translate(150%, 300%)")
    container.off "transitionend", fadeOutWrapper
    callback()

  container.on "transitionend", fadeOutWrapper
  container.css("transform", "translate(-300%, -500%)")


fadeIn = ->

  container = window.currentContainer

  container.removeClass("inactive")
  container.addClass("active")

  window.setTimeout( (-> container.css("transform", "translate(0%, 0%)")) , 5)
