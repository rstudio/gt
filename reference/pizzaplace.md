# A year of pizza sales from a pizza place

A synthetic dataset that describes pizza sales for a pizza place
somewhere in the US. While the contents are artificial, the ingredients
used to make the pizzas are far from it. There are 32 different pizzas
that fall into 4 different categories: `"classic"` (classic pizzas: 'You
probably had one like it before, but never like this!'), `"chicken"`
(pizzas with chicken as a major ingredient: 'Try the Southwest Chicken
Pizza! You'll love it!'), `"supreme"` (pizzas that try a little harder:
'My Soppressata pizza uses only the finest salami from my personal
salumist!'), and, `"veggie"` (pizzas without any meats whatsoever: 'My
Five Cheese pizza has so many cheeses, I can only offer it in Large
Size!').

## Usage

``` r
pizzaplace
```

## Format

A tibble with 49,574 rows and 7 variables:

- id:

  The ID for the order, which consists of one or more pizzas at a given
  `date` and `time`.

- date:

  A character representation of the order date, expressed in the ISO
  8601 date format (`YYYY-MM-DD`).

- time:

  A character representation of the order time, expressed as a 24-hour
  time the ISO 8601 extended time format (`HH:MM:SS`).

- name:

  The short name for the pizza.

- size:

  The size of the pizza, which can either be `"S"`, `"M"`, `"L"`, `"XL"`
  (rare!), or `"XXL"` (even rarer!); most pizzas are available in the
  `"S"`, `"M"`, and `"L"` sizes but exceptions apply.

- type:

  The category or type of pizza, which can either be `"classic"`,
  `"chicken"`, `"supreme"`, or `"veggie"`.

- price:

  The price of the pizza and the amount that it sold for (in USD).

## Details

Each pizza in the dataset is identified by a short `name`. The following
listings provide the full names of each pizza and their main
ingredients.

Classic Pizzas:

- `"classic_dlx"`: The Classic Deluxe Pizza (Pepperoni, Mushrooms, Red
  Onions, Red Peppers, Bacon)

- `"big_meat"`: The Big Meat Pizza (Bacon, Pepperoni, Italian Sausage,
  Chorizo Sausage)

- `"pepperoni"`: The Pepperoni Pizza (Mozzarella Cheese, Pepperoni)

- `"hawaiian"`: The Hawaiian Pizza (Sliced Ham, Pineapple, Mozzarella
  Cheese)

- `"pep_msh_pep"`: The Pepperoni, Mushroom, and Peppers Pizza
  (Pepperoni, Mushrooms, and Green Peppers)

- `"ital_cpcllo"`: The Italian Capocollo Pizza (Capocollo, Red Peppers,
  Tomatoes, Goat Cheese, Garlic, Oregano)

- `"napolitana"`: The Napolitana Pizza (Tomatoes, Anchovies, Green
  Olives, Red Onions, Garlic)

- `"the_greek"`: The Greek Pizza (Kalamata Olives, Feta Cheese,
  Tomatoes, Garlic, Beef Chuck Roast, Red Onions)

Chicken Pizzas:

- `"thai_ckn"`: The Thai Chicken Pizza (Chicken, Pineapple, Tomatoes,
  Red Peppers, Thai Sweet Chilli Sauce)

- `"bbq_ckn"`: The Barbecue Chicken Pizza (Barbecued Chicken, Red
  Peppers, Green Peppers, Tomatoes, Red Onions, Barbecue Sauce)

- `"southw_ckn"`: The Southwest Chicken Pizza (Chicken, Tomatoes, Red
  Peppers, Red Onions, Jalapeno Peppers, Corn, Cilantro, Chipotle Sauce)

- `"cali_ckn"`: The California Chicken Pizza (Chicken, Artichoke,
  Spinach, Garlic, Jalapeno Peppers, Fontina Cheese, Gouda Cheese)

- `"ckn_pesto"`: The Chicken Pesto Pizza (Chicken, Tomatoes, Red
  Peppers, Spinach, Garlic, Pesto Sauce)

- `"ckn_alfredo"`: The Chicken Alfredo Pizza (Chicken, Red Onions, Red
  Peppers, Mushrooms, Asiago Cheese, Alfredo Sauce)

Supreme Pizzas:

- `"brie_carre"`: The Brie Carre Pizza (Brie Carre Cheese, Prosciutto,
  Caramelized Onions, Pears, Thyme, Garlic)

- `"calabrese"`: The Calabrese Pizza ('Nduja Salami, Pancetta, Tomatoes,
  Red Onions, Friggitello Peppers, Garlic)

- `"soppressata"`: The Soppressata Pizza (Soppressata Salami, Fontina
  Cheese, Mozzarella Cheese, Mushrooms, Garlic)

- `"sicilian"`: The Sicilian Pizza (Coarse Sicilian Salami, Tomatoes,
  Green Olives, Luganega Sausage, Onions, Garlic)

- `"ital_supr"`: The Italian Supreme Pizza (Calabrese Salami, Capocollo,
  Tomatoes, Red Onions, Green Olives, Garlic)

- `"peppr_salami"`: The Pepper Salami Pizza (Genoa Salami, Capocollo,
  Pepperoni, Tomatoes, Asiago Cheese, Garlic)

- `"prsc_argla"`: The Prosciutto and Arugula Pizza (Prosciutto di San
  Daniele, Arugula, Mozzarella Cheese)

- `"spinach_supr"`: The Spinach Supreme Pizza (Spinach, Red Onions,
  Pepperoni, Tomatoes, Artichokes, Kalamata Olives, Garlic, Asiago
  Cheese)

- `"spicy_ital"`: The Spicy Italian Pizza (Capocollo, Tomatoes, Goat
  Cheese, Artichokes, Peperoncini verdi, Garlic)

Vegetable Pizzas

- `"mexicana"`: The Mexicana Pizza (Tomatoes, Red Peppers, Jalapeno
  Peppers, Red Onions, Cilantro, Corn, Chipotle Sauce, Garlic)

- `"four_cheese"`: The Four Cheese Pizza (Ricotta Cheese, Gorgonzola
  Piccante Cheese, Mozzarella Cheese, Parmigiano Reggiano Cheese,
  Garlic)

- `"five_cheese"`: The Five Cheese Pizza (Mozzarella Cheese, Provolone
  Cheese, Smoked Gouda Cheese, Romano Cheese, Blue Cheese, Garlic)

- `"spin_pesto"`: The Spinach Pesto Pizza (Spinach, Artichokes,
  Tomatoes, Sun-dried Tomatoes, Garlic, Pesto Sauce)

- `"veggie_veg"`: The Vegetables + Vegetables Pizza (Mushrooms,
  Tomatoes, Red Peppers, Green Peppers, Red Onions, Zucchini, Spinach,
  Garlic)

- `"green_garden"`: The Green Garden Pizza (Spinach, Mushrooms,
  Tomatoes, Green Olives, Feta Cheese)

- `"mediterraneo"`: The Mediterranean Pizza (Spinach, Artichokes,
  Kalamata Olives, Sun-dried Tomatoes, Feta Cheese, Plum Tomatoes, Red
  Onions)

- `"spinach_fet"`: The Spinach and Feta Pizza (Spinach, Mushrooms, Red
  Onions, Feta Cheese, Garlic)

- `"ital_veggie"`: The Italian Vegetables Pizza (Eggplant, Artichokes,
  Tomatoes, Zucchini, Red Peppers, Garlic, Pesto Sauce)

## Dataset ID and Badge

DATA-5

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_pizzaplace.png)

## Dataset Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other datasets:
[`constants`](https://gt.rstudio.com/reference/constants.md),
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md),
[`exibble`](https://gt.rstudio.com/reference/exibble.md),
[`films`](https://gt.rstudio.com/reference/films.md),
[`gibraltar`](https://gt.rstudio.com/reference/gibraltar.md),
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md),
[`illness`](https://gt.rstudio.com/reference/illness.md),
[`metro`](https://gt.rstudio.com/reference/metro.md),
[`nuclides`](https://gt.rstudio.com/reference/nuclides.md),
[`peeps`](https://gt.rstudio.com/reference/peeps.md),
[`photolysis`](https://gt.rstudio.com/reference/photolysis.md),
[`reactions`](https://gt.rstudio.com/reference/reactions.md),
[`rx_addv`](https://gt.rstudio.com/reference/rx_addv.md),
[`rx_adsl`](https://gt.rstudio.com/reference/rx_adsl.md),
[`sp500`](https://gt.rstudio.com/reference/sp500.md),
[`sza`](https://gt.rstudio.com/reference/sza.md),
[`towny`](https://gt.rstudio.com/reference/towny.md)

## Examples

``` r
dplyr::glimpse(pizzaplace)
#> Rows: 49,574
#> Columns: 7
#> $ id    <chr> "2015-000001", "2015-000002", "2015-000002", "2015-000002", "201…
#> $ date  <chr> "2015-01-01", "2015-01-01", "2015-01-01", "2015-01-01", "2015-01…
#> $ time  <chr> "11:38:36", "11:57:40", "11:57:40", "11:57:40", "11:57:40", "11:…
#> $ name  <chr> "hawaiian", "classic_dlx", "mexicana", "thai_ckn", "five_cheese"…
#> $ size  <chr> "M", "M", "M", "L", "L", "L", "L", "M", "M", "M", "S", "S", "S",…
#> $ type  <chr> "classic", "classic", "veggie", "chicken", "veggie", "supreme", …
#> $ price <dbl> 13.25, 16.00, 16.00, 20.75, 18.50, 20.75, 20.75, 16.50, 16.50, 1…
```
