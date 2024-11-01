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
    el.__clickFlag = false;

    var observer = new MutationObserver(function(mutations, obs) {
      var reactableElement = self.getReactable(el);
      if (reactableElement) {
        var rows = reactableElement.querySelectorAll('.rt-tr');
        if (rows.length > 0) {
          // Listener so we know it's an actual click, not another state change.
          body_rows = reactableElement.querySelectorAll('.rt-tbody .rt-tr');
          if (body_rows.length > 0) {
            body_rows.forEach(function(row) {
              if (!row.__clickListenerAdded) {
                row.addEventListener('click', function() {
                  el.__clickFlag = true;
                });
                row.__clickListenerAdded = true;
              }
            });
          }

          // State change listener, so we fire getValue *after* the state updates.
          if (!reactableElement.__reactableStateChangeListener) {
            reactableElement.__reactableStateChangeListener = function() {
              $(el).trigger('change.gtShiny');
            };
            Reactable.onStateChange(reactableElement.id, reactableElement.__reactableStateChangeListener);
          }
          el.__initialized = true;
          if (el.__awaiting_set && el.__awaiting_set.length) {
            value = el.__awaiting_set;
            el.__awaiting_set = null;
            self.setValue(el, value);
          }
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
      return; // Table is reloading or not fully initialized
    }

    var reactableElement = this.getReactable(el);
    if (!reactableElement) {
      return; // Initialization is finishing, state will report when finished.
    }

    var selectedRows = Reactable.getState(reactableElement.id).selected;
    if (selectedRows === undefined) {
      return; // Initialization is finishing, state will report when finished.
    }

    if (selectedRows.length === 0) {
      if (el.__clickFlag) {
        el.__clickFlag = false;
        return [0]; // [0] if nothing is selected due to user click
      }
      return null; // null if table is initializing or reloading
    }

    el.__clickFlag = false;
    return selectedRows.map(function(row) { return row + 1; });
  },
  /**
   * Sets the value of the selected rows in the gtShiny element.
   *
   * @param {HTMLElement} el    - The element containing the gtShiny.
   * @param {Array}       value - The row IDs to set as selected.
   */
  setValue: function(el, value) {
    if (!Array.isArray(value)) {
      value = [value];
    }
    if (!el.__initialized) {
      el.__awaiting_set = value;
      this.initializeListener(el);
      return;
    }
    var reactableElement = this.getReactable(el);
    if (reactableElement) {
      var instance = Reactable.getInstance(reactableElement.id);
      if (instance) {
        instance.setRowsSelected(value);
      }
    }
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
  },
  /**
   * Receives a message from Shiny and sets the selected rows.
   *
   * @param {HTMLElement} el    - The element containing the gtShiny.
   * @param {Array}       value - The row IDs to set as selected.
   */
  receiveMessage: function(el, value){
    this.setValue(el, value);
  }
});

// Register the input binding with Shiny
Shiny.inputBindings.register(gtShinyBinding, 'gt.gtShinyBinding');
