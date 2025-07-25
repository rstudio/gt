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

# apply_to_grp works

    Code
      apply_to_grp(gt_group_error, arg_list)
    Condition
      Error in `apply_to_grp()`:
      ! Failure in Table 2
      Caused by error in `cols_align()`:
      ! Can't select columns that don't exist.
      x Column `num` doesn't exist.

