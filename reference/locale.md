# Localize formatting and symbols

Localize formatting and symbols

## Specify locale

[`gt()`](https://gt.rstudio.com/reference/gt.md), some `cols_*()` and
`fmt_*()` functions have a `locale` argument. You can pass `locale` as a
2 letters string or 4. (e.g. `"fr"` for French, `"pt-BR"` for Brazilian
Portuguese). gt also resolves different spellings internally as much as
possible. For example `"en_GB"` will work out of the box.

## Range of action of locale

One of the advantage of using gt its consistency in using symbols and
currencies in multiple languages

There are two ways to localize your results with gt.

- Passing it **globally** `gt(locale = "<locale>")`

Will localize everything possible in the
[`gt()`](https://gt.rstudio.com/reference/gt.md) pipeline.

- In individual `fmt_()` functions

- Localize buttons in
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)

Will only affect the output of one specific function (or override global
setting).

`locale` has very low precedence usually. As soon as you override some
parameters, `sep_mark`, `dec_mark`, `incl_space`, they will be override
`locale`.

## See also

[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md),
[`info_flags()`](https://gt.rstudio.com/reference/info_flags.md)

## Examples

``` r
# The Spanish locale uses `.` as thousands sep (English uses `,`) and uses
# a `,` as the decimal mark

# Using the locale in `gt()` will format automatically all output in
# subsequent `fmt_*()` calls.
exibble |>
  gt(locale = "es-AR") |>
  fmt_number()


  

num
```
