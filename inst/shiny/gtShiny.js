/**
 * Shiny InputBinding for a gtShiny Module.
 */
var gtShinyBinding = new Shiny.InputBinding();

$.extend(gtShinyBinding, {
  /**
   * Finds the gtShiny element within the given scope.
   *
   * @param {HTMLElement} scope - The scope in which to search for the gtShiny
   *                              element.
   * @returns {jQuery} The jQuery object containing the gtShiny element.
   */
  find: function(scope) {
    return $(scope).find('.gt_shiny');
  },
  /**
   * Gets the reactable element within the given gtShiny element.
   *
   * @param {HTMLElement} el - The element containing the gtShiny.
   * @returns {HTMLElement|null} The reactable element, or null if not found.
   */
  getReactable: function(el) {
    return el.querySelector('.reactable');
  },
  /**
   * Gets the value of the selected rows from the gtShiny element.
   *
   * @param {HTMLElement} el - The element containing the gtShiny.
   * @returns {Array|null} The selected row IDs, or null if no rows are selected.
   */
  getValue: function(el) {
    var rctbl = this.getReactable(el);
    return rctbl ? Reactable.getState(rctbl.id).selected : null;
  },
  /**
   * Update Shiny when a gtShiny element changes.
   *
   * @param {HTMLElement} el       - The element containing the gtShiny.
   * @param {function}    callback - The callback to trigger when the gtShiny
   *                                 element changes.
   */
  subscribe: function(el, callback) {
    var rctbl = this.getReactable(el);
    if (rctbl) {
      console.log('Subscribing to changes for:', rctbl.id);
      rctbl.__reactableStateChangeListener = function() {
        callback();
      };
      Reactable.onStateChange(rctbl.id, rctbl.__reactableStateChangeListener);
    }
  },
  /**
   * Unsubscribes from custom events for the gtShiny element.
   *
   * @param {HTMLElement} el - The element containing the gtShiny.
   */
  unsubscribe: function(el) {
    console.log('unsubscribe() called');
    var rctbl = this.getReactable(el);
    if (rctbl && rctbl.__reactableStateChangeListener) {
      var listenerFn = rctbl.__reactableStateChangeListener;
      Reactable.onStateChange(rctbl.id, listenerFn, { remove: true });
      delete rctbl.__reactableStateChangeListener;
    }
  }
});

// Register the input binding with Shiny
Shiny.inputBindings.register(gtShinyBinding, 'gt.gtShinyBinding');


// Mutation Observer to detect when gtShiny tables are fully loaded
(function() {
  var observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
      var gtShinyObjs = document.querySelectorAll('.gt_shiny');
      gtShinyObjs.forEach(function(obj) {
        var rows = obj.querySelectorAll('.rt-tbody .rt-tr');
        if (rows.length > 0) {
          Shiny.bindAll();
          observer.disconnect(); // Stop observing once the element is found and loaded
        }
      });
    });
  });

  observer.observe(document.body, { childList: true, subtree: true });
})();
