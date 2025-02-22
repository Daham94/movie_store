// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery_ujs
//= require bootstrap-spockets
//= require turbolinks
//= require_tree


import "bootstrap"
import 'select2'
import 'select2/dist/css/select2.css'

$(document).on("turbolinks:load", () => {
  if ($('.upload-hider-labels').length > 0) {
    $('.upload-hider-labels').each(function() {
      return $(this).closest('.field').find('.upload-hider-fields').hide();
    });
  }

  $('form').on('click', '.replace-upload', function(e) {
    var uploadFields, uploadLabels;
    e.preventDefault();
    uploadLabels = $(this).closest('.upload-hider-labels');
    uploadFields = $(this).closest('.field').find('.upload-hider-fields');
    uploadLabels.hide();
    return uploadFields.show();
  });
  $('.select2').select2();
})



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
