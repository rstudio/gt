.dt_source_notes_key <- "_source_notes"

dt_source_notes_get <- function(data) {

  dt__get(data, .dt_source_notes_key)
}

dt_source_notes_set <- function(data, source_notes) {

  dt__set(data, .dt_source_notes_key, source_notes)
}

dt_source_notes_init <- function(data) {

  list() %>%
    dt_source_notes_set(source_notes = ., data = data)
}

dt_source_notes_add <- function(data, source_note) {

  # There is the option to remove all source notes with
  # `tab_source_note(source_note = NULL)`; this will
  # essentially reinitialize the list
  if (is.null(source_note)) {
    return(dt_source_notes_init(data = data))
  }

  data %>%
    dt_source_notes_get() %>%
    append(
      list(source_note)
    ) %>%
    dt_source_notes_set(source_notes = ., data = data)
}

dt_source_notes_build <- function(data, context) {

  source_notes <- dt_source_notes_get(data)

  source_notes <-
    lapply(source_notes, function(label) process_text(label, context)) %>%
    unlist()

  dt_source_notes_set(data = data, source_notes = source_notes)
}
