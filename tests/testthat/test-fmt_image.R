test_that("fmt_image() works correctly", {

  # Create an input data frame with numbers corresponding to image files
  data_tbl <-
    data.frame(
      a = c(
        "1, 2",
        "3",
        "5, 6,7",
        NA
      ),
      stringsAsFactors = FALSE
    )

  # Get the path to the images
  image_path <- system.file("metro_svg", package = "gt")

  # Create a `gt_tbl` object with `gt()` and the `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Extract vectors from the table object for comparison
  # to the original dataset
  a <- dt_data_get(tab)[["a"]]

  # Expect the extracted values to match those of the original dataset
  expect_equal(data_tbl$a, a)

  # Expect an error when attempting to format a column that does not exist
  expect_error(tab |> fmt_image(columns = b))

  # Format the `a` column to display images
  expect_equal(
    (tab |>
       fmt_image(columns = a, path = image_path, file_pattern = "metro_{x}.svg") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0ZFQ0UwMCIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIyMUUyMCIgZD0iTTU3Ny4wMjYgNzYzLjk4N1YyMzQuMDIyaC05Mi4zNTJjLTIzLjkzOCAxOC43MTQtODEuMDE3IDU0LjAyNi0xNDIuNTY1IDgzLjI2NWwtMzIuMjg3IDE1LjE0NyAzNi4wMTQgODEuMDQyIDI3Ljk0Ni0xNC4zOGMxOS4zNzgtOS42MTEgNzIuNjE3LTM3LjM1NyA5MC42OC01MS43djQxNi41OTFoMTEyLjU2NCIvPjwvc3ZnPg==\" style=\"height:2em;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzAwNjVBRSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTY3Ni40NCA3NDAuOTV2LTg4LjcwOUg0NTcuNzZjNi44ODgtMzAuNzEzIDYwLjEzMy03NS4wMzUgODcuMDg0LTk5Ljc1IDYzLjg1NS01Ny45OTcgMTIxLjYyLTk5LjE4OCAxMjEuNjItMTkwLjAxIDAtMTA4LjA1LTg3LjY3OC0xNjAuNjEtMTgwLjc2LTE2MC42MS03MS4zNjYgMC0xMTguNjIgMjAuOTkxLTE2OS43MiA2NS4zNzlsNTUuNzE3IDczLjU4NWMxMi42NTItMTQuMzM1IDQ0Ljk3NS00OC4xMTIgOTEuNDM0LTQ4LjExMiA1Ny43NiAwIDg3Ljc0MiAzNi43NzYgODcuNzQyIDgyLjQ4MiAwIDUxLjIwOS0zOC4wMjMgODcuODU0LTczLjM0NCAxMTguNjMtNzAuNzA5IDYxLjU5LTEzMS40NyAxMTUuNTctMTQ0Ljk0IDE3Ny4yOXY2OS44NjFoMzQzLjg1MSIvPjwvc3ZnPg==\" style=\"height:2em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzlGOTcxQSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTY4NS40MyA2MDUuOTJjMC03NC4xOC00NC4xMzYtMTE3LjkzLTEwMi41NjktMTI5LjE4di0xLjM0OGM1Ni4xMzktMjEuMDQxIDg1LjM3Ni02My4yMDIgODUuMzc2LTExNy44OSAwLTcwLjYxNC02MS40MDctMTMzLjY2LTE3MC0xMzMuNjYtNjEuNjQ2IDAtMTEyLjkxIDE3LjE5Ny0xNTguNjMgNDcuMzkzbDM2Ljc4NCA3OC4xMDRjMTcuMzM0LTE1LjA5OCA0OS40NDMtMzguNjM3IDk4LjM3Mi0zOC42MzcgNTUuNzI1IDAgODEuMTk4IDI5LjU2MiA4MS4xOTggNjMuMzYzIDAgNDAuNTM3LTMyLjIxMSA2Ni4xMzUtODQuMTg5IDY2LjEzNWgtNTUuNzM5djg3Ljg5MWg1NC45M2M1NC4yNTcgMCAxMDAuNjkgMTkuMjU4IDEwMC42OSA4MC4yMDMgMCA0NS4wMTQtMzguMTUxIDc3Ljk0My05OS44NzcgNzcuOTQzLTQ0Ljk4NSAwLTgxLjgzMi0xNy40NzYtMTA0LjU5LTM0LjM1NWwtNDAuMjkxIDgxLjU5YzQyLjc4OCAyNC4xMzQgODQuMDMgMzkuOTQzIDE1Mi4xOSAzOS45NDMgMTIzLjMxLjA3IDIwNi4zNS03NC40MyAyMDYuMzUtMTY3LjQ3Ii8+PC9zdmc+\" style=\"height:2em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0YxOTA0MyIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3OS43MSA1OTIuNzVjMC03OS40ODYtNTguNDItMTU5LjY4LTIwMy4yNy0xNjcuMjVsLTE1LjEzMy0uNzEyIDcuNDE4LTEwMS4zNTFoMTkwLjc4di04Ny45MTNoLTI3OC41MmwtMjEuMDM2IDI3NS40OSA4Mi41NDIuNzEyYzk3LjYxMy45NzkgMTIyLjk3OSA1My4zMTcgMTIyLjk3OSA5MS42NSAwIDYyLjE2LTUxLjYyNyA4NS42MjktOTIuODY2IDg1LjYyOS00NS4xODggMC03NS4wMzctMTYuNjE1LTEwMC42MS0zMy45MTJsLTM4Ljg5NyA4Mi42OWM0MS4wOTMgMjMuMTcyIDg5LjI3NyAzOC4zMzMgMTQ1LjUgMzguMzMzIDEyMC43NzEtLjA0IDIwMS4xMi04Mi4wOCAyMDEuMTItMTgzLjM3Ii8+PC9zdmc+\" style=\"height:2em;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzg0QzI4RSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3Mi4xNiA1NzAuNTZjMC05OS4zMDUtNzAuNTE5LTE1Ny4wMS0xNTcuMTEtMTU3LjAxLTU1Ljk0NyAwLTg5Ljg4NyAyMC4yODctMTA3Ljc5IDM2LjA2OCA2LjY5OS0xMDYuNTIxIDYxLjQzOC0xNTkuODcgMTM0LjQxLTE1OS44NyAyOS43NjggMCA1Ni45NzMgNi43MDEgNzEuMDMxIDEyLjg5MWwxNi42Ni05MC4xMTVjLTIxLjcxMy01LjQxNy00OC45MTYtOC45MzQtNzguODMtOC45MzQtMTY2LjU5IDAtMjUxLjM2IDEyNS44OTEtMjUxLjM2IDMwOS44OTEgMCAxNDAuMzUgNTAuODk1IDI0MC4zMSAxOTMuNTggMjQwLjMxIDEwOC44OS0uMDAxIDE3OS40MS03Ny41NjEgMTc5LjQwOS0xODMuMjMxbS0xMDUuODA5IDExLjI4YzAgNDUuNjI1LTI2LjI1NCA4OC40My03Ny40MDEgODguNDMtNTIuNTc4IDAtODAuOTUzLTQ4Ljc3Mi04MC45NTMtOTkuMTIgMC0xNS42MzggMC0zNS45NTkgNi4wMDQtNDQuOTY4IDEwLjQ3MS0xNi41ODYgMzYuNzk3LTI5LjE4NCA2OS4wNTUtMjkuMTg0IDUwLjkyIDAgODMuMjkgMzUuMTkgODMuMjkgODQuODRsLjAwNS4wMDJ6Ii8+PC9zdmc+\" style=\"height:2em;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0YyQTRCNyIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3OCAzMzcuNjd2LTg2LjI5N0gzMDcuMjl2ODguNTQ3aDI1Ny4zOGwtMTI5LjAyIDI0MC4yYy00Ni41NzYgODYuNTI0LTY1LjMwOCAxMzEuMjQtNjUuMzA4IDIwMS4zNmgxMjAuODkxYy0uMDExLTgzLjM2IDcwLjM1LTI0MS43MyAxODYuNzctNDQzLjgxMSIvPjwvc3ZnPg==\" style=\"height:2em;vertical-align:middle;\"></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_image(columns = a, path = image_path, file_pattern = "metro_{x}.svg", sep = " / ") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0ZFQ0UwMCIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIyMUUyMCIgZD0iTTU3Ny4wMjYgNzYzLjk4N1YyMzQuMDIyaC05Mi4zNTJjLTIzLjkzOCAxOC43MTQtODEuMDE3IDU0LjAyNi0xNDIuNTY1IDgzLjI2NWwtMzIuMjg3IDE1LjE0NyAzNi4wMTQgODEuMDQyIDI3Ljk0Ni0xNC4zOGMxOS4zNzgtOS42MTEgNzIuNjE3LTM3LjM1NyA5MC42OC01MS43djQxNi41OTFoMTEyLjU2NCIvPjwvc3ZnPg==\" style=\"height:2em;vertical-align:middle;\"> / <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzAwNjVBRSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTY3Ni40NCA3NDAuOTV2LTg4LjcwOUg0NTcuNzZjNi44ODgtMzAuNzEzIDYwLjEzMy03NS4wMzUgODcuMDg0LTk5Ljc1IDYzLjg1NS01Ny45OTcgMTIxLjYyLTk5LjE4OCAxMjEuNjItMTkwLjAxIDAtMTA4LjA1LTg3LjY3OC0xNjAuNjEtMTgwLjc2LTE2MC42MS03MS4zNjYgMC0xMTguNjIgMjAuOTkxLTE2OS43MiA2NS4zNzlsNTUuNzE3IDczLjU4NWMxMi42NTItMTQuMzM1IDQ0Ljk3NS00OC4xMTIgOTEuNDM0LTQ4LjExMiA1Ny43NiAwIDg3Ljc0MiAzNi43NzYgODcuNzQyIDgyLjQ4MiAwIDUxLjIwOS0zOC4wMjMgODcuODU0LTczLjM0NCAxMTguNjMtNzAuNzA5IDYxLjU5LTEzMS40NyAxMTUuNTctMTQ0Ljk0IDE3Ny4yOXY2OS44NjFoMzQzLjg1MSIvPjwvc3ZnPg==\" style=\"height:2em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzlGOTcxQSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTY4NS40MyA2MDUuOTJjMC03NC4xOC00NC4xMzYtMTE3LjkzLTEwMi41NjktMTI5LjE4di0xLjM0OGM1Ni4xMzktMjEuMDQxIDg1LjM3Ni02My4yMDIgODUuMzc2LTExNy44OSAwLTcwLjYxNC02MS40MDctMTMzLjY2LTE3MC0xMzMuNjYtNjEuNjQ2IDAtMTEyLjkxIDE3LjE5Ny0xNTguNjMgNDcuMzkzbDM2Ljc4NCA3OC4xMDRjMTcuMzM0LTE1LjA5OCA0OS40NDMtMzguNjM3IDk4LjM3Mi0zOC42MzcgNTUuNzI1IDAgODEuMTk4IDI5LjU2MiA4MS4xOTggNjMuMzYzIDAgNDAuNTM3LTMyLjIxMSA2Ni4xMzUtODQuMTg5IDY2LjEzNWgtNTUuNzM5djg3Ljg5MWg1NC45M2M1NC4yNTcgMCAxMDAuNjkgMTkuMjU4IDEwMC42OSA4MC4yMDMgMCA0NS4wMTQtMzguMTUxIDc3Ljk0My05OS44NzcgNzcuOTQzLTQ0Ljk4NSAwLTgxLjgzMi0xNy40NzYtMTA0LjU5LTM0LjM1NWwtNDAuMjkxIDgxLjU5YzQyLjc4OCAyNC4xMzQgODQuMDMgMzkuOTQzIDE1Mi4xOSAzOS45NDMgMTIzLjMxLjA3IDIwNi4zNS03NC40MyAyMDYuMzUtMTY3LjQ3Ii8+PC9zdmc+\" style=\"height:2em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0YxOTA0MyIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3OS43MSA1OTIuNzVjMC03OS40ODYtNTguNDItMTU5LjY4LTIwMy4yNy0xNjcuMjVsLTE1LjEzMy0uNzEyIDcuNDE4LTEwMS4zNTFoMTkwLjc4di04Ny45MTNoLTI3OC41MmwtMjEuMDM2IDI3NS40OSA4Mi41NDIuNzEyYzk3LjYxMy45NzkgMTIyLjk3OSA1My4zMTcgMTIyLjk3OSA5MS42NSAwIDYyLjE2LTUxLjYyNyA4NS42MjktOTIuODY2IDg1LjYyOS00NS4xODggMC03NS4wMzctMTYuNjE1LTEwMC42MS0zMy45MTJsLTM4Ljg5NyA4Mi42OWM0MS4wOTMgMjMuMTcyIDg5LjI3NyAzOC4zMzMgMTQ1LjUgMzguMzMzIDEyMC43NzEtLjA0IDIwMS4xMi04Mi4wOCAyMDEuMTItMTgzLjM3Ii8+PC9zdmc+\" style=\"height:2em;vertical-align:middle;\"> / <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzg0QzI4RSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3Mi4xNiA1NzAuNTZjMC05OS4zMDUtNzAuNTE5LTE1Ny4wMS0xNTcuMTEtMTU3LjAxLTU1Ljk0NyAwLTg5Ljg4NyAyMC4yODctMTA3Ljc5IDM2LjA2OCA2LjY5OS0xMDYuNTIxIDYxLjQzOC0xNTkuODcgMTM0LjQxLTE1OS44NyAyOS43NjggMCA1Ni45NzMgNi43MDEgNzEuMDMxIDEyLjg5MWwxNi42Ni05MC4xMTVjLTIxLjcxMy01LjQxNy00OC45MTYtOC45MzQtNzguODMtOC45MzQtMTY2LjU5IDAtMjUxLjM2IDEyNS44OTEtMjUxLjM2IDMwOS44OTEgMCAxNDAuMzUgNTAuODk1IDI0MC4zMSAxOTMuNTggMjQwLjMxIDEwOC44OS0uMDAxIDE3OS40MS03Ny41NjEgMTc5LjQwOS0xODMuMjMxbS0xMDUuODA5IDExLjI4YzAgNDUuNjI1LTI2LjI1NCA4OC40My03Ny40MDEgODguNDMtNTIuNTc4IDAtODAuOTUzLTQ4Ljc3Mi04MC45NTMtOTkuMTIgMC0xNS42MzggMC0zNS45NTkgNi4wMDQtNDQuOTY4IDEwLjQ3MS0xNi41ODYgMzYuNzk3LTI5LjE4NCA2OS4wNTUtMjkuMTg0IDUwLjkyIDAgODMuMjkgMzUuMTkgODMuMjkgODQuODRsLjAwNS4wMDJ6Ii8+PC9zdmc+\" style=\"height:2em;vertical-align:middle;\"> / <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0YyQTRCNyIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3OCAzMzcuNjd2LTg2LjI5N0gzMDcuMjl2ODguNTQ3aDI1Ny4zOGwtMTI5LjAyIDI0MC4yYy00Ni41NzYgODYuNTI0LTY1LjMwOCAxMzEuMjQtNjUuMzA4IDIwMS4zNmgxMjAuODkxYy0uMDExLTgzLjM2IDcwLjM1LTI0MS43MyAxODYuNzctNDQzLjgxMSIvPjwvc3ZnPg==\" style=\"height:2em;vertical-align:middle;\"></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_image(columns = a, path = image_path, file_pattern = "metro_{x}.svg", height = "3em") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0ZFQ0UwMCIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIyMUUyMCIgZD0iTTU3Ny4wMjYgNzYzLjk4N1YyMzQuMDIyaC05Mi4zNTJjLTIzLjkzOCAxOC43MTQtODEuMDE3IDU0LjAyNi0xNDIuNTY1IDgzLjI2NWwtMzIuMjg3IDE1LjE0NyAzNi4wMTQgODEuMDQyIDI3Ljk0Ni0xNC4zOGMxOS4zNzgtOS42MTEgNzIuNjE3LTM3LjM1NyA5MC42OC01MS43djQxNi41OTFoMTEyLjU2NCIvPjwvc3ZnPg==\" style=\"height:3em;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzAwNjVBRSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTY3Ni40NCA3NDAuOTV2LTg4LjcwOUg0NTcuNzZjNi44ODgtMzAuNzEzIDYwLjEzMy03NS4wMzUgODcuMDg0LTk5Ljc1IDYzLjg1NS01Ny45OTcgMTIxLjYyLTk5LjE4OCAxMjEuNjItMTkwLjAxIDAtMTA4LjA1LTg3LjY3OC0xNjAuNjEtMTgwLjc2LTE2MC42MS03MS4zNjYgMC0xMTguNjIgMjAuOTkxLTE2OS43MiA2NS4zNzlsNTUuNzE3IDczLjU4NWMxMi42NTItMTQuMzM1IDQ0Ljk3NS00OC4xMTIgOTEuNDM0LTQ4LjExMiA1Ny43NiAwIDg3Ljc0MiAzNi43NzYgODcuNzQyIDgyLjQ4MiAwIDUxLjIwOS0zOC4wMjMgODcuODU0LTczLjM0NCAxMTguNjMtNzAuNzA5IDYxLjU5LTEzMS40NyAxMTUuNTctMTQ0Ljk0IDE3Ny4yOXY2OS44NjFoMzQzLjg1MSIvPjwvc3ZnPg==\" style=\"height:3em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzlGOTcxQSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTY4NS40MyA2MDUuOTJjMC03NC4xOC00NC4xMzYtMTE3LjkzLTEwMi41NjktMTI5LjE4di0xLjM0OGM1Ni4xMzktMjEuMDQxIDg1LjM3Ni02My4yMDIgODUuMzc2LTExNy44OSAwLTcwLjYxNC02MS40MDctMTMzLjY2LTE3MC0xMzMuNjYtNjEuNjQ2IDAtMTEyLjkxIDE3LjE5Ny0xNTguNjMgNDcuMzkzbDM2Ljc4NCA3OC4xMDRjMTcuMzM0LTE1LjA5OCA0OS40NDMtMzguNjM3IDk4LjM3Mi0zOC42MzcgNTUuNzI1IDAgODEuMTk4IDI5LjU2MiA4MS4xOTggNjMuMzYzIDAgNDAuNTM3LTMyLjIxMSA2Ni4xMzUtODQuMTg5IDY2LjEzNWgtNTUuNzM5djg3Ljg5MWg1NC45M2M1NC4yNTcgMCAxMDAuNjkgMTkuMjU4IDEwMC42OSA4MC4yMDMgMCA0NS4wMTQtMzguMTUxIDc3Ljk0My05OS44NzcgNzcuOTQzLTQ0Ljk4NSAwLTgxLjgzMi0xNy40NzYtMTA0LjU5LTM0LjM1NWwtNDAuMjkxIDgxLjU5YzQyLjc4OCAyNC4xMzQgODQuMDMgMzkuOTQzIDE1Mi4xOSAzOS45NDMgMTIzLjMxLjA3IDIwNi4zNS03NC40MyAyMDYuMzUtMTY3LjQ3Ii8+PC9zdmc+\" style=\"height:3em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0YxOTA0MyIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3OS43MSA1OTIuNzVjMC03OS40ODYtNTguNDItMTU5LjY4LTIwMy4yNy0xNjcuMjVsLTE1LjEzMy0uNzEyIDcuNDE4LTEwMS4zNTFoMTkwLjc4di04Ny45MTNoLTI3OC41MmwtMjEuMDM2IDI3NS40OSA4Mi41NDIuNzEyYzk3LjYxMy45NzkgMTIyLjk3OSA1My4zMTcgMTIyLjk3OSA5MS42NSAwIDYyLjE2LTUxLjYyNyA4NS42MjktOTIuODY2IDg1LjYyOS00NS4xODggMC03NS4wMzctMTYuNjE1LTEwMC42MS0zMy45MTJsLTM4Ljg5NyA4Mi42OWM0MS4wOTMgMjMuMTcyIDg5LjI3NyAzOC4zMzMgMTQ1LjUgMzguMzMzIDEyMC43NzEtLjA0IDIwMS4xMi04Mi4wOCAyMDEuMTItMTgzLjM3Ii8+PC9zdmc+\" style=\"height:3em;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzg0QzI4RSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3Mi4xNiA1NzAuNTZjMC05OS4zMDUtNzAuNTE5LTE1Ny4wMS0xNTcuMTEtMTU3LjAxLTU1Ljk0NyAwLTg5Ljg4NyAyMC4yODctMTA3Ljc5IDM2LjA2OCA2LjY5OS0xMDYuNTIxIDYxLjQzOC0xNTkuODcgMTM0LjQxLTE1OS44NyAyOS43NjggMCA1Ni45NzMgNi43MDEgNzEuMDMxIDEyLjg5MWwxNi42Ni05MC4xMTVjLTIxLjcxMy01LjQxNy00OC45MTYtOC45MzQtNzguODMtOC45MzQtMTY2LjU5IDAtMjUxLjM2IDEyNS44OTEtMjUxLjM2IDMwOS44OTEgMCAxNDAuMzUgNTAuODk1IDI0MC4zMSAxOTMuNTggMjQwLjMxIDEwOC44OS0uMDAxIDE3OS40MS03Ny41NjEgMTc5LjQwOS0xODMuMjMxbS0xMDUuODA5IDExLjI4YzAgNDUuNjI1LTI2LjI1NCA4OC40My03Ny40MDEgODguNDMtNTIuNTc4IDAtODAuOTUzLTQ4Ljc3Mi04MC45NTMtOTkuMTIgMC0xNS42MzggMC0zNS45NTkgNi4wMDQtNDQuOTY4IDEwLjQ3MS0xNi41ODYgMzYuNzk3LTI5LjE4NCA2OS4wNTUtMjkuMTg0IDUwLjkyIDAgODMuMjkgMzUuMTkgODMuMjkgODQuODRsLjAwNS4wMDJ6Ii8+PC9zdmc+\" style=\"height:3em;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0YyQTRCNyIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3OCAzMzcuNjd2LTg2LjI5N0gzMDcuMjl2ODguNTQ3aDI1Ny4zOGwtMTI5LjAyIDI0MC4yYy00Ni41NzYgODYuNTI0LTY1LjMwOCAxMzEuMjQtNjUuMzA4IDIwMS4zNmgxMjAuODkxYy0uMDExLTgzLjM2IDcwLjM1LTI0MS43MyAxODYuNzctNDQzLjgxMSIvPjwvc3ZnPg==\" style=\"height:3em;vertical-align:middle;\"></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_image(columns = a, path = image_path, file_pattern = "metro_{x}.svg", height = 40) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0ZFQ0UwMCIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIyMUUyMCIgZD0iTTU3Ny4wMjYgNzYzLjk4N1YyMzQuMDIyaC05Mi4zNTJjLTIzLjkzOCAxOC43MTQtODEuMDE3IDU0LjAyNi0xNDIuNTY1IDgzLjI2NWwtMzIuMjg3IDE1LjE0NyAzNi4wMTQgODEuMDQyIDI3Ljk0Ni0xNC4zOGMxOS4zNzgtOS42MTEgNzIuNjE3LTM3LjM1NyA5MC42OC01MS43djQxNi41OTFoMTEyLjU2NCIvPjwvc3ZnPg==\" style=\"height:40px;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzAwNjVBRSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTY3Ni40NCA3NDAuOTV2LTg4LjcwOUg0NTcuNzZjNi44ODgtMzAuNzEzIDYwLjEzMy03NS4wMzUgODcuMDg0LTk5Ljc1IDYzLjg1NS01Ny45OTcgMTIxLjYyLTk5LjE4OCAxMjEuNjItMTkwLjAxIDAtMTA4LjA1LTg3LjY3OC0xNjAuNjEtMTgwLjc2LTE2MC42MS03MS4zNjYgMC0xMTguNjIgMjAuOTkxLTE2OS43MiA2NS4zNzlsNTUuNzE3IDczLjU4NWMxMi42NTItMTQuMzM1IDQ0Ljk3NS00OC4xMTIgOTEuNDM0LTQ4LjExMiA1Ny43NiAwIDg3Ljc0MiAzNi43NzYgODcuNzQyIDgyLjQ4MiAwIDUxLjIwOS0zOC4wMjMgODcuODU0LTczLjM0NCAxMTguNjMtNzAuNzA5IDYxLjU5LTEzMS40NyAxMTUuNTctMTQ0Ljk0IDE3Ny4yOXY2OS44NjFoMzQzLjg1MSIvPjwvc3ZnPg==\" style=\"height:40px;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzlGOTcxQSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTY4NS40MyA2MDUuOTJjMC03NC4xOC00NC4xMzYtMTE3LjkzLTEwMi41NjktMTI5LjE4di0xLjM0OGM1Ni4xMzktMjEuMDQxIDg1LjM3Ni02My4yMDIgODUuMzc2LTExNy44OSAwLTcwLjYxNC02MS40MDctMTMzLjY2LTE3MC0xMzMuNjYtNjEuNjQ2IDAtMTEyLjkxIDE3LjE5Ny0xNTguNjMgNDcuMzkzbDM2Ljc4NCA3OC4xMDRjMTcuMzM0LTE1LjA5OCA0OS40NDMtMzguNjM3IDk4LjM3Mi0zOC42MzcgNTUuNzI1IDAgODEuMTk4IDI5LjU2MiA4MS4xOTggNjMuMzYzIDAgNDAuNTM3LTMyLjIxMSA2Ni4xMzUtODQuMTg5IDY2LjEzNWgtNTUuNzM5djg3Ljg5MWg1NC45M2M1NC4yNTcgMCAxMDAuNjkgMTkuMjU4IDEwMC42OSA4MC4yMDMgMCA0NS4wMTQtMzguMTUxIDc3Ljk0My05OS44NzcgNzcuOTQzLTQ0Ljk4NSAwLTgxLjgzMi0xNy40NzYtMTA0LjU5LTM0LjM1NWwtNDAuMjkxIDgxLjU5YzQyLjc4OCAyNC4xMzQgODQuMDMgMzkuOTQzIDE1Mi4xOSAzOS45NDMgMTIzLjMxLjA3IDIwNi4zNS03NC40MyAyMDYuMzUtMTY3LjQ3Ii8+PC9zdmc+\" style=\"height:40px;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0YxOTA0MyIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3OS43MSA1OTIuNzVjMC03OS40ODYtNTguNDItMTU5LjY4LTIwMy4yNy0xNjcuMjVsLTE1LjEzMy0uNzEyIDcuNDE4LTEwMS4zNTFoMTkwLjc4di04Ny45MTNoLTI3OC41MmwtMjEuMDM2IDI3NS40OSA4Mi41NDIuNzEyYzk3LjYxMy45NzkgMTIyLjk3OSA1My4zMTcgMTIyLjk3OSA5MS42NSAwIDYyLjE2LTUxLjYyNyA4NS42MjktOTIuODY2IDg1LjYyOS00NS4xODggMC03NS4wMzctMTYuNjE1LTEwMC42MS0zMy45MTJsLTM4Ljg5NyA4Mi42OWM0MS4wOTMgMjMuMTcyIDg5LjI3NyAzOC4zMzMgMTQ1LjUgMzguMzMzIDEyMC43NzEtLjA0IDIwMS4xMi04Mi4wOCAyMDEuMTItMTgzLjM3Ii8+PC9zdmc+\" style=\"height:40px;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iIzg0QzI4RSIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3Mi4xNiA1NzAuNTZjMC05OS4zMDUtNzAuNTE5LTE1Ny4wMS0xNTcuMTEtMTU3LjAxLTU1Ljk0NyAwLTg5Ljg4NyAyMC4yODctMTA3Ljc5IDM2LjA2OCA2LjY5OS0xMDYuNTIxIDYxLjQzOC0xNTkuODcgMTM0LjQxLTE1OS44NyAyOS43NjggMCA1Ni45NzMgNi43MDEgNzEuMDMxIDEyLjg5MWwxNi42Ni05MC4xMTVjLTIxLjcxMy01LjQxNy00OC45MTYtOC45MzQtNzguODMtOC45MzQtMTY2LjU5IDAtMjUxLjM2IDEyNS44OTEtMjUxLjM2IDMwOS44OTEgMCAxNDAuMzUgNTAuODk1IDI0MC4zMSAxOTMuNTggMjQwLjMxIDEwOC44OS0uMDAxIDE3OS40MS03Ny41NjEgMTc5LjQwOS0xODMuMjMxbS0xMDUuODA5IDExLjI4YzAgNDUuNjI1LTI2LjI1NCA4OC40My03Ny40MDEgODguNDMtNTIuNTc4IDAtODAuOTUzLTQ4Ljc3Mi04MC45NTMtOTkuMTIgMC0xNS42MzggMC0zNS45NTkgNi4wMDQtNDQuOTY4IDEwLjQ3MS0xNi41ODYgMzYuNzk3LTI5LjE4NCA2OS4wNTUtMjkuMTg0IDUwLjkyIDAgODMuMjkgMzUuMTkgODMuMjkgODQuODRsLjAwNS4wMDJ6Ii8+PC9zdmc+\" style=\"height:40px;vertical-align:middle;\"> <img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iMCAwIDEwNTAgMTA1MCIgc3R5bGU9ImhlaWdodDoxZW07d2lkdGg6MS4xM2VtO3ZlcnRpY2FsLWFsaWduOi0wLjEyNWVtO21hcmdpbi1sZWZ0OmF1dG87bWFyZ2luLXJpZ2h0OmF1dG87Zm9udC1zaXplOmluaGVyaXQ7b3ZlcmZsb3c6dmlzaWJsZTtwb3NpdGlvbjpyZWxhdGl2ZTsiPjxjaXJjbGUgZmlsbD0iI0YyQTRCNyIgY3g9IjUwMCIgY3k9IjUwMCIgcj0iNTAwIi8+PHBhdGggZmlsbD0iIzIzMUYyMCIgZD0iTTY3OCAzMzcuNjd2LTg2LjI5N0gzMDcuMjl2ODguNTQ3aDI1Ny4zOGwtMTI5LjAyIDI0MC4yYy00Ni41NzYgODYuNTI0LTY1LjMwOCAxMzEuMjQtNjUuMzA4IDIwMS4zNmgxMjAuODkxYy0uMDExLTgzLjM2IDcwLjM1LTI0MS43MyAxODYuNzctNDQzLjgxMSIvPjwvc3ZnPg==\" style=\"height:40px;vertical-align:middle;\"></span>",
      NA
    )
  )

  # Create another input data frame with image links
  data_tbl_alt <-
    data.frame(
      a = c(
        "https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-Gray.png,https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo.png",
        "https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-flat.svg"
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the `data_tbl_alt` dataset
  tab_alt <- gt(data = data_tbl_alt)

  # Format the `a` column to display images
  expect_equal(
    (tab_alt |>
       fmt_image(columns = a) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-Gray.png\" style=\"height:2em;vertical-align:middle;\"> <img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo.png\" style=\"height:2em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-flat.svg\" style=\"height:2em;vertical-align:middle;\"></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_image(columns = a, sep = " / ") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-Gray.png\" style=\"height:2em;vertical-align:middle;\"> / <img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo.png\" style=\"height:2em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-flat.svg\" style=\"height:2em;vertical-align:middle;\"></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_image(columns = a, height = "3em") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-Gray.png\" style=\"height:3em;vertical-align:middle;\"> <img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo.png\" style=\"height:3em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-flat.svg\" style=\"height:3em;vertical-align:middle;\"></span>"
    )
  )

  # Create another input data frame with image names
  data_tbl_alt_2 <-
    data.frame(
      a = c(
        "RStudio-Logo-Gray.png,RStudio-Logo.png",
        "RStudio-Logo-flat.svg"
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the `data_tbl_alt_2` dataset
  tab_alt_2 <- gt(data = data_tbl_alt_2)

  url_path_1 <- "https://www.rstudio.com/wp-content/uploads/2018/10/"
  url_path_2 <- "https://www.rstudio.com/wp-content/uploads/2018/10"

  # Format the `a` column to display images
  expect_equal(
    (tab_alt_2 |>
       fmt_image(columns = a, path = url_path_1) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10//RStudio-Logo-Gray.png\" style=\"height:2em;vertical-align:middle;\"> <img src=\"https://www.rstudio.com/wp-content/uploads/2018/10//RStudio-Logo.png\" style=\"height:2em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10//RStudio-Logo-flat.svg\" style=\"height:2em;vertical-align:middle;\"></span>"
    )
  )

  expect_equal(
    (tab_alt_2 |>
       fmt_image(columns = a, path = url_path_2) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-Gray.png\" style=\"height:2em;vertical-align:middle;\"> <img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo.png\" style=\"height:2em;vertical-align:middle;\"></span>",
      "<span style=\"white-space:nowrap;\"><img src=\"https://www.rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-flat.svg\" style=\"height:2em;vertical-align:middle;\"></span>"
    )
  )

  # Expect that a column with NAs will work fine with `fmt_image()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_image()`
  expect_no_error(
    na_col_tbl |> fmt_image(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_image(columns = a, rows = 1:5) |> as_raw_html()
  )
})
