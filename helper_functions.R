set_params  <- function(template_file, choices_weeks, choices_forecasters) {
  lines  <- readLines(template_file)
  yaml_range  <- grep("^---", lines)[1:2]
  yaml_lines  <- do.call(seq.int, as.list(yaml_range))
  yaml  <- lines[yaml_lines]
  yaml_length  <- length(yaml)
  choices_weeks_line  <- max(grep("^    choices:", yaml))
  choices_forecasters_line  <- min(grep("^    choices:", yaml))
  yaml[choices_weeks_line]  <- paste("    choices:", choices_weeks)
  yaml[choices_forecasters_line]  <- paste("    choices:", choices_forecasters)
  lines  <- lines[-(1:yaml_length)]
  file_lines  <- c(yaml, lines)
  writeLines(file_lines, con = paste0(tools::file_path_sans_ext(template_file), "-modified.Rmd"))
  invisible(TRUE)
}

# Example usage 
set_params(template_file = "Parameters_testing1.Rmd", 
           choices_weeks = "[5, 6, 7, 8]",
           choices_forecasters = "[CMU-TimeSeries, Karlen-pypm]")

