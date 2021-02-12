import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Bienvenue dans G2M", "Notre espace pour consulter vos dépôts", "#CAPOUPASCAP"],
    typeSpeed: 40,
    loop: true
  });
}

const loadDynamicAdminText = () => {
  new Typed('#admin-typed-text', {
    strings: ["Bienvenue dans G2M", "l'appli pour gérer et pricer les dépôts", "Bientôt des alertes de disponible pour notre page ADMIN!"],
    typeSpeed: 30,
    loop: true
  });
}

const loadDynamicProText = () => {
  new Typed('#pro-typed-text', {
    strings: ["Bienvenue dans l'espace Professionnel", "Sélectionnez nos pièces pour votre friperie"],
    typeSpeed: 30,
    loop: true
  });
}

export { loadDynamicBannerText };

export { loadDynamicAdminText };

export { loadDynamicProText };
