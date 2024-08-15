# str_substitute() works well

    Code
      str_substitute(c("223", "223", "224"), c(1, 2), 2)
    Condition
      Error in `str_substitute()`:
      ! Can't recycle `start` (size 2) to size 3.
    Code
      str_substitute(c("223", "223", "224"), c(1), c(2, 3))
    Condition
      Error in `str_substitute()`:
      ! Can't recycle `end` (size 2) to size 3.
    Code
      str_substitute(c("223", "223", "224", "225"), c(1, 2, 3, 4), c(2, 3))
    Condition
      Error in `str_substitute()`:
      ! Can't recycle `end` (size 2) to size 4.

