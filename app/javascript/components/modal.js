const displayModal = () => {
  let modal = null

  const openModal = function (e) {
    e.preventDefault()
    const target = document.querySelector(e.target.getAttribute('herf'))
    target.style.display = null
    target.removeAttribute('aria-hidden')
    target.setAttribute('aria-modal', 'true')
    modal = target
    modal.addEventListener('click', closeModal)
    modal.querySelector('.js-modal-close').addEventListener('click', closeModal)
    modal.querySelector('.js-modal-stop')addEventListener('click', stopPropagation)
  }

  const closeModal = function (e) {
    if (modal === null) return
    e.preventDefault()
    const target = document.querySelector(e.target.getAttribute('herf'))
    target.style.display = null
    target.setAttribute('aria-hidden', 'true')
    target.removeAttribute('aria-modal')
    modal.querySelector('.js-modal-close').removeEventListener('click', closeModal)
    modal.querySelector('.js-modal-stop')removeEventListener('click', stopPropagation)
    modal = null
  }

  const stopPropagation = function (e) {
    e.stopPropagation()
  }


  document.querySelectorAll('.js-modal').forEach(a => {
    a.addEventListener('click', openModal)

  })

  window.addEventListener('keydown', function (e) {
    if (e.key === "Escape" || e.key === "Esc") {
      closeModal(e)
    }
  })
}

export { displayModal };
