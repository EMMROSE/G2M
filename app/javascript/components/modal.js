const openModal = () => {
  $('#my_modal').on('show.bs.modal', function(e) {

      //get data-id attribute of the clicked element
      var productId = $(e.relatedTarget).data('product-id');

      //populate the textbox
      $(e.currentTarget).find('input[name="productId"]').val(productId);
  });
}

export { openModal };
