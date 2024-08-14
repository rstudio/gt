# str_substitute() works well

    Code
      str_substitute(c("223", "223", "224"), c(1, 2), 2)
    Condition
      Error:
      ! Can't recycle `start` to length 3
    Code
      str_substitute(c("223", "223", "224"), c(1), c(2, 3))
    Condition
      Error:
      ! Can't recycle `end` to length 3

