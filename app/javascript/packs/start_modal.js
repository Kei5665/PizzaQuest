document.addEventListener('turbolinks:load', () => {

  var myModal = document.getElementById('dialog-rounded');
  document.onreadystatechange = function () {
    myModal.showModal()
  };
  
  })