// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require bootstrap.min
//= require wysihtml5
//= require parser_rules/advanced

$(document).ready(function() {
  $(document).delegate('.btn-new-blog', 'click', function(e) {
    e.preventDefault();
    $.ajax({
      url: "/blog_posts/new_blog",
      type: 'GET',
      success: function(response) {
        $('.blog-content').html(response);
      }
    })
  });
  $(document).delegate('form.blog-form button', 'click', function(e) {
    e.preventDefault();
    var frm = $("form.blog-form");
    $.ajax({
      url: "/blog_posts/create_blog",
      type: 'POST',
      data: frm.serialize(),
      success: function(response) {

      }
    })
  });
  $(document).delegate('a.log-out', 'click', function(e) {
    e.preventDefault();
    $.ajax({
      url: "/accounts/sign_out",
      type: 'DELETE',
      success: function(response) {
        window.location.href = "/"
      }
    })
  });
  $(document).delegate('a.sort-btn', 'click', function(e) {
    e.preventDefault();
    var dom = $(e.currentTarget);
    var sort;
    if (dom.hasClass("clicked")) {
      sort = "asc";
      dom.removeClass("clicked");
    } else {
      sort = "desc";
      dom.addClass("clicked");
    }
    $.ajax({
      url: "/blog_posts/sort_blogs",
      type: "GET",
      data: {
        sort: sort
      },
      success: function(response) {
        console.log(response)
        $(".blog-content").html("");
        var htmlString = '<li class="blog-head-bar title">Blog Title</li>'
        htmlString += '<li class="blog-head-bar author">Author Info</li>';
        $.each(response, function(key,value){
          htmlString += '<li class="title"><a href="/blog_posts/'+value[0]+'">'
          htmlString += value[1]+'('+value[4]+')</a></li>'
          htmlString += '<li class="author-detail">'+value[3]+'</li>'
        });
        $(".blog-content").html(htmlString);
      }
    })
  });

});
