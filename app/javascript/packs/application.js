import "bootstrap";
import "./sb-admin-2/sb-admin-2";

import graphFunction from './charts/donutPie';

import tables from './data_tables/tables.js';
import scrollToTop from './easyOutScroll.js';

tables();

graphFunction();

let scroller = document.querySelector('.scroll-to-top').addEventListener("click", (event) => {
  scrollToTop(1000);
})

//function to hide the up button of the page. and only show if you scroll down
$(document).ready(function(){
    //Check to see if the window is top if not then display button
    $(window).scroll(function(){
      if ($(this).scrollTop() > 100) {
        $('.scrollToTop').fadeIn();
      } else {
        $('.scrollToTop').fadeOut();
      }
    });

    //Click event to scroll to top
    $('.scrollToTop').click(function(){
      $('html, body').animate({scrollTop : 0},800);
      return false;
    });
});
