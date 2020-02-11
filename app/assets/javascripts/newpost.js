$(function(){
  function buildHTML(data){
    var html = `<div class="main-content">
                  <div class="main-content__userName">
                    ${data.user_name}
                  </div>
                  <div class="main-content__image">
                    <img src="${data.image}">
                  </div>
                  <div class="main-content__icons">
                        <div class="main-content__logo-far"><a rel="nofollow" data-method="post" href="/posts/39/likes"><i class="far fa-heart"></i></a></div>
                    <div class="main-content__logo"><a href="/posts/39"><i class="far fa-comment"></i></a></div>
                    <div class="likes_count">いいね！数<span>0</span></div>
                  </div>
                  <div class="main-content__text">
                    <div class="main-content__text-userName">${data.user_name}</div>
                    ${data.message}
                  </div>
                  <div class="main-content__tags">
                    #${data.tag}
                  </div>
                </div>`
    return html;
  }
  $('#_form_ajax').on('submit', function(e){
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
    .done(function(test){
      var lala = buildHTML(test);
      // var fChild = $('.main-content');
      // console.log(fChild);
      $('.main-contents').prepend(lala);
      $('.img_ajax').val('');
      $('.msg_ajax').val('');
      $('.tag_ajax').val('');
      $('.input__form__submit-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});