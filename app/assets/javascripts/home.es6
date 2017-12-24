$(document).ready(() => {

  $(`button#call`).click((event) => {
    event.preventDefault();
    $.ajax({
      type: 'PUT',
      url: `/call`,
      dataType: 'json',
      beforeSend: () => {},
      success: (data) => {
        console.log('RESULT', data);
      },
      error: (xhr) => {
        console.log('ERRORS', xhr.responseJSON.errors);
      },
      complete: () => {}
    });
  });

});
