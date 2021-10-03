const changeButton = () => {
  const button = document.querySelector('#clickme');
  button.addEventListener('click', (event) => {
    // Callback
    event.currentTarget.innerText = 'Virement demandé';
    // event.currentTarget.setAttribute("disabled", "");
  });
};

export { changeButton };




  const newButton = () => {
    const button = document.querySelector('#button');
    button.addEventListener('click', (event) => {
    // Callback
    button.classList.add("onclic", 250);
    function validate() {
      setTimeout(function() {
        $( "#button" ).removeClass( "onclic" );
        $( "#button" ).addClass( "validate", 450, callback );
      }, 2250 );
    }
      function callback() {
        setTimeout(function() {
          $( "#button" ).removeClass( "validate" );
        }, 1250 );
      }
    });
  };

  export { newButton };

