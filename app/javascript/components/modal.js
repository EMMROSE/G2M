const displayModal = () => {
  const modals = document.querySelectorAll('.js-modal');

  if (modals) {
    modals.forEach((modal) => {
      modal.addEventListener('click', (event) => {
        event.currentTarget.remove('modal-inactive');
        event.currentTarget.add('modal-active');
      });
    });
};

export { displayModal };


//   const openModal = function (e) {
//     const target = document.querySelector('.js-modal')
//     target.removeAttribute('aria-hidden')
//     target.setAttribute('aria-modal', 'true')
//     modal = target
//     modal.addEventListener('click', closeModal)
//     modal.querySelector('.js-modal-close').addEventListener('click', closeModal)
//     modal.querySelector('.js-modal-stop')addEventListener('click', stopPropagation)
//   }

//   const closeModal = function (e) {
//     if (modal === null) return
//     e.preventDefault()
//     const target = document.querySelector('.js-modal')
//     target.setAttribute('aria-hidden', 'true')
//     target.removeAttribute('aria-modal')
//     modal.querySelector('.js-modal-close').removeEventListener('click', closeModal)
//     modal.querySelector('.js-modal-stop')removeEventListener('click', stopPropagation)
//     modal = null
//   }
// }


  // document.querySelectorAll('.js-modal').forEach(i => {
  //   i.addEventListener('click', openModal)

  // })

  // window.addEventListener('keydown', function (e) {
  //   if (e.key === "Escape" || e.key === "Esc") {
  //     closeModal(e)
  //   }
  // })
