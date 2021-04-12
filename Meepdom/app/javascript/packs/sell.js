import { setInterval } from 'timers';

const form = document.querySelector('.sell-game-form');
const button = document.querySelector('#sell-button');

const sellFormToggle = e => {
  e.preventDefault();
  if (button.value === 'Sell Game') {
    button.value = 'Hide Form';
  } else if (button.value === 'Hide Form') {
    button.value = 'Sell Game';
  }
  form.classList.toggle('sell-game-form');
  if (
    form.classList.contains('scale-down') ||
    form.classList.contains('hide') ||
    form.classList.value.length === 0
  ) {
    form.classList.add('scale-up');
    form.classList.remove('scale-down');
    form.classList.remove('hide');
  } else if (form.classList.contains('scale-up')) {
    form.classList.remove('scale-up');
    setTimeout(function() {
      form.classList.add('hide');
    }, 700);
  }

  console.log(form.classList.value.length);
};

export { sellFormToggle };
