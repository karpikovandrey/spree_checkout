$(document).ready(function(){
  $(document).on('click', '.progress-steps a', function(){
    var $this = $(this),
        url = $this.attr('href');

    $.ajax({
      method: 'GET',
      url: url,
      dataType: 'script'
    });

    return false;
  });
});
