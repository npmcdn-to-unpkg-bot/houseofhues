// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
  var boxDiv = $('.room1').width();
  $('[class^="room"]').css({'height':boxDiv+'px'});
  $(window).on('resize', function(){
    boxDiv = $('.room1').width();
    $('[class^="room"]').css({'height':boxDiv+'px'});
  });

  $('.js-grid').tightGrid();
});

//tightgrid.js
(function($) {
  class TightGrid {
    constructor($el, options = {}) {
      this.options = options;
      this.$el     = $el;
      this.columnWidth  =
        this.options.columnWidth ||
        this.$el.find(this.options.itemSelector).first().outerWidth(true);
      this.build();
      if (this.options.resize) {
        this.resizeHandler = this.rebuild.bind(this);
        $(window).on('resize', this.resizeHandler);
      }
    }
    build() {
      const colsInRow = Math.floor(this.$el.width() / this.columnWidth);
      let $items      = [];
      this.$el.find(this.options.itemSelector).each((_, item) => {
        let $item = $(item);
        let cols  = Math.floor($item.outerWidth(true) / this.columnWidth);
        for(let i = 0; i < cols; i++) { $items.push($item) };
      });
      $items.forEach(($item, i) => {
        if (i < colsInRow) { return }
        const $itemAbove = $items[i - colsInRow];
        const bottomOffsetOfItemAbove =
          $itemAbove.offset().top +
          $itemAbove.outerHeight() +
          parseInt($itemAbove.css('margin-bottom'));
        const topOffsetOfItem =
          $item.offset().top -
          parseInt($item.css('margin-top')) -
          parseInt($itemAbove.css('margin-bottom'));
        const delta = topOffsetOfItem - bottomOffsetOfItemAbove;
        if (delta) { $item.css('margin-top', -delta) }
      });
    }
    rebuild() {
      this.reset();
      this.build();
    }
    reset() {
      this.$el.find(this.options.itemSelector).css('margin-top', '');
    }
    destroy() {
      this.reset();
      this.options.resize && $(window).off('resize', this.resizeHandler);
    }
  }
  $.fn.tightGrid = function(options = {}) {
    options = $.extend({}, $.fn.tightGrid.defaults, options);
    this.each(function() {
      let $this = $(this);
      if (!$this.data('tightGrid')) {
        $this.data('tightGrid', new TightGrid($this, options));
      }
    });
  }
  $.fn.tightGrid.defaults = {
    itemSelector: '.js-item',
    columnWidth: null,
    resize: true
  }
}(jQuery));
