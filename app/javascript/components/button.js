const changeButton = () => {
  const button = document.querySelector('#clickme');
  button.addEventListener('click', (event) => {
    // Callback
    event.currentTarget.innerText = 'Virement demandé';
    // event.currentTarget.setAttribute("disabled", "");
  });
};

export { changeButton };
