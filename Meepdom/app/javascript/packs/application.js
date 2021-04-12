import 'bootstrap';
import buyGame from '../plugins/sweet_alert2';
import { sellFormToggle } from '../packs/sell';

const buttons = document.querySelectorAll('#buy-game');
const sellButton = document.querySelector('#sell-button');

buttons.forEach(button => {
  button.addEventListener('click', buyGame);
});

sellButton.addEventListener('click', sellFormToggle);
