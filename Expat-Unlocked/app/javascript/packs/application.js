import 'bootstrap';
import { initPicker } from '../plugins/flatpickr';
window.initPicker = initPicker;

const nav = document.querySelector('.navigation');
const dropdown = document.querySelector('.navigation__hamburger');
const mobileNav = document.querySelector('.navigation__drop');
const showData = document.querySelectorAll('.profile-stats__display');

window.addEventListener('scroll', e => {
  if (window.scrollY > 20) {
    nav.classList.add('sticky-nav');
    nav.classList.remove('fadeout');
  } else {
    nav.classList.remove('sticky-nav');
    nav.style.background = '$primary';
    nav.style.color = '#000';
  }
});

dropdown.addEventListener('click', e => {
  mobileNav.classList.toggle('navigation__drop');
  mobileNav.classList.toggle('dropdown');
});

showData.forEach(element => {
  element.addEventListener('click', e => {
    e.target.parentNode.nextElementSibling.classList.toggle('show-data');
    e.target.parentNode.nextElementSibling.classList.toggle(
      'profile-stats__data'
    );
  });
});
