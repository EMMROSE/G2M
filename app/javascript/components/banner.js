import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Bienvenue dans G2M", "l'appli pour gérer et pricer les dépôts", "Bientôt des alertes de disponible"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
