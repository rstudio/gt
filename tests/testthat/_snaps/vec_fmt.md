# check_vector_valid() works correctly

    Code
      check_vector_valid(1, "integer")
    Condition
      Error:
      ! `x` must be integer vectors, not 1.
    Code
      check_vector_valid(TRUE, c("numeric", "integer"))
    Condition
      Error:
      ! `x` must be numeric or integer vectors, not TRUE.
    Code
      check_vector_valid(data.frame(x = 1), c("numeric", "integer"))
    Condition
      Error:
      ! `x` must be numeric or integer vectors, not 1.

