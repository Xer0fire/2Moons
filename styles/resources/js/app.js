/*****
* CONFIGURATION
*/

//Main navigation
$.navigation = $('nav > ul.nav');

$.panelIconOpened = 'fa fa-chevron-down';
$.panelIconClosed = 'fa fa-chevron-up';

//Default colours
$.brandPrimary =  '#20a8d8';
$.brandSuccess =  '#4dbd74';
$.brandInfo =     '#63c2de';
$.brandWarning =  '#f8cb00';
$.brandDanger =   '#f86c6b';

$.grayDark =      '#2a2c36';
$.gray =          '#55595c';
$.grayLight =     '#818a91';
$.grayLighter =   '#d1d4d7';
$.grayLightest =  '#f8f9fa';

'use strict';

/****
* MAIN NAVIGATION
*/

$(document).ready(function($){

  //check if BLOCKED_BY_CLIENT
  if (typeof(cookieconsent) != "undefined") {
	window.cookieconsent.initialise({
		"palette": {
			"popup": {
				"background": "#000"
			},
			"button": {
				"background": "transparent",
				"text": "#f1d600",
				"border": "#f1d600"
			}
		},
		"content": {
			"message": "This website uses cookies, by using this website you consent to all of our cookies.",
			"dismiss": "Got it!",
			"link": "Learn more",
			"href": "https://cookiesandyou.com"
		},
		"position": "bottom-right"
	});
  }

  //stop modal adding padding and margins to body and nav elements
  $.fn.modal.Constructor.prototype._setScrollbar = function () {};

  //move modals
  $("#modal-container").append( $("div.modal") );

  // Add class .active to current link
  $.navigation.find('a').each(function(){

    var cUrl = String(window.location).split('?')[0];

    if (cUrl.substr(cUrl.length - 1) == '#') {
      cUrl = cUrl.slice(0,-1);
    }

    if ($($(this))[0].href==cUrl) {
      $(this).addClass('active');

      $(this).parents('ul').add(this).each(function(){
        $(this).parent().addClass('open');
      });
    }
  });

  // Dropdown Menu
  $.navigation.on('click', 'a', function(e){

    if ($.ajaxLoad) {
      e.preventDefault();
    }

    if ($(this).hasClass('nav-dropdown-toggle')) {
      $(this).parent().toggleClass('open');
      var navState = [];
      $("nav > ul > li.nav-item").each(function( index ) {
        var isOpen = $( this )[0].className.split(" ")[2];
        navState[index] = isOpen;
      });
      localStorage.setItem("omicron-navState", navState);
      resizeBroadcast();
    }

  });

  function resizeBroadcast() {

    var timesRun = 0;
    var interval = setInterval(function(){
      timesRun += 1;
      if(timesRun === 5){
        clearInterval(interval);
      }
      window.dispatchEvent(new Event('resize'));
    }, 62.5);
  }

  /* ---------- Menu States ---------- */
  var navState = localStorage.getItem("omicron-navState");
  if (navState) {
    navState = navState.split(",");

    $("nav > ul > li.nav-item").each(function( index ) {
      if(navState[index] == 'open'){
        $(this).toggleClass('open');
      }
    });
  }

  var sidebarNav = localStorage.getItem("omicron-sidebarNav");
  sidebarNav = sidebarNav=='true';
  $('body').toggleClass('sidebar-hidden', sidebarNav);
  
  var sidebarMinimized = localStorage.getItem("omicron-sidebarMinimized");
  sidebarMinimized = sidebarMinimized=='true';
  $('body').toggleClass('sidebar-minimized', sidebarMinimized);
  $('body').toggleClass('brand-minimized', sidebarMinimized);
  
  var asideNav = localStorage.getItem("omicron-asideNav");
  asideNav = asideNav=='true';
  $('body').toggleClass('aside-menu-hidden', asideNav);

  /* ---------- Main Menu Open/Close, Min/Full ---------- */
  $('.sidebar-toggler').click(function(){
    var $this = $(this);
    sidebarNav = !sidebarNav;
    $('body').toggleClass('sidebar-hidden', sidebarNav);
    localStorage.setItem("omicron-sidebarNav", sidebarNav);
    resizeBroadcast();
  });

  $('.sidebar-minimizer').click(function(){
    var $this = $(this);
    sidebarMinimized = !sidebarMinimized;
    $('body').toggleClass('sidebar-minimized', sidebarMinimized);
    localStorage.setItem("omicron-sidebarMinimized", sidebarMinimized);
    resizeBroadcast();
  });

  $('.brand-minimizer').click(function(){
    $('body').toggleClass('brand-minimized');
  });

  $('.aside-menu-toggler').click(function(){
    var $this = $(this);
    asideNav = !asideNav;
    $('body').toggleClass('aside-menu-hidden', asideNav);
    localStorage.setItem("omicron-asideNav", asideNav);
    resizeBroadcast();
  });

  $('.mobile-sidebar-toggler').click(function(){
    $('body').toggleClass('sidebar-mobile-show');
    resizeBroadcast();
  });

  $('.mobile-aside-menu-toggler').click(function(){
    $('body').toggleClass('aside-mobile-show');
    resizeBroadcast();
  });

  $('.sidebar-close').click(function(){
    $('body').toggleClass('sidebar-opened').parent().toggleClass('sidebar-opened');
  });

  /* ---------- Disable moving to top ---------- */
  $('a[href="#"][data-top!=true]').click(function(e){
    e.preventDefault();
  });

});

/****
* CARDS ACTIONS
*/

$('.card-actions').on('click', 'a, button', function(e){

  if ($(this).hasClass('btn-close')) {
    e.preventDefault();
    $(this).parent().parent().parent().fadeOut();
  } else if ($(this).hasClass('btn-minimize')) {
    e.preventDefault();
    // var $target = $(this).parent().parent().next('.card-body').collapse({toggle: true});
    if ($(this).hasClass('collapsed')) {
      $('i',$(this)).removeClass($.panelIconOpened).addClass($.panelIconClosed);
    } else {
      $('i',$(this)).removeClass($.panelIconClosed).addClass($.panelIconOpened);
    }
  } else if ($(this).hasClass('btn-setting')) {
    e.preventDefault();
    $('#myModal').modal('show');
  }

});

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

function init(url) {

  /* ---------- Tooltip ---------- */
  $('[rel="tooltip"],[data-rel="tooltip"]').tooltip({"placement":"bottom",delay: { show: 400, hide: 200 }});

  /* ---------- Popover ---------- */
  $('[rel="popover"],[data-rel="popover"],[data-toggle="popover"]').popover();

}
