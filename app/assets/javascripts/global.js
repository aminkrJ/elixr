$(document).on("turbolinks:load", function(){
  $('.colorpicker').colorpicker({
    colorSelectors: {
      'a': '#777777',
      'b': '#337ab7',
      'c': '#5cb85c',
      'd': '#5bc0de',
      'e': '#f0ad4e',
      'f': '#d9534f'
    }
  });

  $('.wysihtml5').summernote({
  });
});
