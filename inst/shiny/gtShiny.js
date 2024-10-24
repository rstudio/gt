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
   * Initializes the gtShiny element by setting up the Reactable state change
   * listener once the Reactable is loaded.
   *
   * @param {HTMLElement} el - The element containing the gtShiny.
   */
  initializeListener: function(el) {
    if (el.__initialized) {
      return;
    }
    var self = this;
    var observer = new MutationObserver(function(mutations, obs) {
      var reactableElement = self.getReactable(el);
      if (reactableElement) {
        var rows = reactableElement.querySelectorAll('.rt-tr');
        if (rows.length > 0) {
          if (!reactableElement.__reactableStateChangeListener) {
            reactableElement.__reactableStateChangeListener = function() {
              $(el).trigger('change.gtShiny');
            };
            Reactable.onStateChange(reactableElement.id, reactableElement.__reactableStateChangeListener);
          }
          $(el).trigger('change.gtShiny');
          el.__initialized = true;
          obs.disconnect();
        }
      }
    });
    observer.observe(el, { childList: true, subtree: true });
  },
  /**
   * Initializes the gtShiny element by binding Shiny and setting up the listener.
   *
   * @param {string} id - The ID of the element to initialize.
   */
  initialize: function(id) {
    var el = document.getElementById(id);
    if (el) {
      Shiny.bindAll();
      el.__initialized = false;
      this.initializeListener(el);
    }
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
    if (!el.__initialized) {
      this.initializeListener(el);
      return null;
    }
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
