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
    var reactableElement = this.getReactable(el);
    if (reactableElement) {
      var selectedRows = Reactable.getState(reactableElement.id).selected;
      return selectedRows ? selectedRows.map(function(row) { return row + 1; }) : null;
    }
    return null;
  },
  /**
   * Update Shiny when a gtShiny element changes.
   *
   * @param {HTMLElement} el       - The element containing the gtShiny.
   * @param {function}    callback - The callback to trigger when the gtShiny
   *                                 element changes.
   */
  subscribe: function(el, callback) {
    $(el).on('change.gtShiny', function(event) {
      callback();
    });
  },
  /**
   * Unsubscribes from custom events for the gtShiny element.
   *
   * @param {HTMLElement} el - The element containing the gtShiny.
   */
  unsubscribe: function(el) {
    $(el).off('change.gtShiny');
  }
});

// Register the input binding with Shiny
Shiny.inputBindings.register(gtShinyBinding, 'gt.gtShinyBinding');

/**
 * Processes all gtShiny elements on the page and executes a callback for
 * each element that contains a populated Reactable table.
 *
 * @param {function} callback - The callback function to execute for each
 *                              gtShiny element that has a Reactable table
 *                              with rows. The callback receives the gtShiny
 *                              element and the Reactable element as
 *                              arguments.
 */
function processGtShinyElements(callback) {
  var gtShinyObjs = document.querySelectorAll('.gt_shiny');
  gtShinyObjs.forEach(function(gtShinyElement) {
    var reactableElement = gtShinyElement.querySelector('.reactable');
    if (reactableElement) {
      var rows = reactableElement.querySelectorAll('.rt-tr');
      if (rows.length > 0) {
        callback(gtShinyElement, reactableElement);
      }
    }
  });
}

// Mutation Observer to detect when gtShiny tables are fully loaded initially
(function() {
  // Observer for setting up Shiny binding on first gt_shiny load
  var bindObserver = new MutationObserver(function() {
    processGtShinyElements(function(gtShinyElement, reactableElement) {
      Shiny.bindAll();
      bindObserver.disconnect();
    });
  });
  bindObserver.observe(document.body, { childList: true, subtree: true });

  // Observer for setting up Reactable state change listeners
  var stateChangeObserver = new MutationObserver(function() {
    processGtShinyElements(function(gtShinyElement, reactableElement) {
      if (!reactableElement.__reactableStateChangeListener) {
        reactableElement.__reactableStateChangeListener = function() {
          $(gtShinyElement).trigger('change.gtShiny');
        };
        Reactable.onStateChange(reactableElement.id, reactableElement.__reactableStateChangeListener);
      }
    });
  });
  stateChangeObserver.observe(document.body, { childList: true, subtree: true });
})();
