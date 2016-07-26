(function ($) {
  $(document).on('ready page:load', function () {
    $('[data-autocomplete-select]').each(function () {
      var element = $(this);
      var hidden = $('<input type="hidden"/>')
        .attr('name', element.attr('name'))
        .val(element.val())
        .insertAfter(element);

      var options = $.extend({
        minLength: 2
      }, element.data('autocomplete-select'), {
        focus: function( event, ui ) {
          element.val( ui.item.label );
          return false;
        },
        select: function( event, ui ) {
          element.val( ui.item.label );
          hidden.val( ui.item.value );
          return false;
        }
      });

      element.autocomplete(options).removeAttr('name');
    });
  });
})(jQuery);
