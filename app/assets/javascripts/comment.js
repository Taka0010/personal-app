$(function(){
  function buildHTML(data){
    var html = `<p>
                  <span>${data.user_name}</span>：${data.comment}
                </p>`
    return html;
  }
  $('#comment_ajax').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments-list').prepend(html);
      // var fChild = $('.main-content');
      // console.log(fChild);
      // $('.main-contents').prepend(lala);
      // $('.img_ajax').val('');
      // $('.msg_ajax').val('');
      // $('.tag_ajax').val('');
      $('.cmt-box').val('');
      $('#cmt-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});