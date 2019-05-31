import "bootstrap";
// import "jquery";
// import "./dataTables/tables";
import "./sb-admin-2/sb-admin-2";

import tables from './data_tables/tables.js';
import scrollToTop from './easyOutScroll.js';

tables();

let scroller = document.querySelector('.scroll-to-top').addEventListener("click", (event) => {
  scrollToTop(1000);
})
