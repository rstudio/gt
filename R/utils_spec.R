capture_call <- function(name = as.character(sys.call(1))[[1]], fun = sys.function(sys.parent()), env = parent.frame()) {
  formals <- formals(fun)
  args <- mget(names(formals), env)

  same <- unlist(Map(formals, args, f = identical))
  custom_args <- args[!same]
  call2(name, !!!custom_args)
}

new_gt_spec <- function(funs, call) {
  structure(funs, call = call, class = "gt_spec")
}

#' @export
print.gt_spec <- function(x, ...) {
  cat("<", as_label(attr(x, "call")), ">\n", sep = "")
}
