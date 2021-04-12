import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Mix sexy coctail"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
