if (!requireNamespace("ragg", quietly = TRUE) ||
    !requireNamespace("systemfonts", quietly = TRUE)) {
  stop("Install ragg and systemfonts to rebuild the profile banner.")
}

args <- commandArgs(trailingOnly = TRUE)
if (length(args)) {
  serif <- file.path(args[1], "InstrumentSerif-Regular.ttf")
  mono <- file.path(args[1], "DMMono-Regular.ttf")
  if (!all(file.exists(c(serif, mono)))) {
    stop("The font directory must contain InstrumentSerif-Regular.ttf and DMMono-Regular.ttf.")
  }
} else {
  serif <- systemfonts::match_font("serif")$path
  mono <- systemfonts::match_font("mono")$path
}
systemfonts::register_font("Portfolio Serif", serif)
systemfonts::register_font("Portfolio Mono", mono)

color <- c(paper = "#f7f4ef", ink = "#242424", accent = "#b11f4b",
           line = "#dedede", muted = "#5c5c5c")
dir.create("assets", showWarnings = FALSE)
ragg::agg_png("assets/profile-banner.png", width = 1680, height = 340,
              units = "px", res = 144, background = color["paper"])
grid::grid.newpage()
grid::pushViewport(grid::viewport(xscale = c(0, 1680), yscale = c(340, 0)))

text <- function(label, x, y, size, family = "Portfolio Mono", fill = "ink") {
  grid::grid.text(label, x = grid::unit(x, "native"), y = grid::unit(y, "native"),
                  just = "left",
                  gp = grid::gpar(fontfamily = family, fontsize = size, col = color[fill]))
}
line <- function(x, y, fill = "line", width = 1) {
  grid::grid.lines(grid::unit(x, "native"), grid::unit(y, "native"),
                   gp = grid::gpar(col = color[fill], lwd = width))
}
circle <- function(x, y, radius, fill = "paper", stroke = "line", width = 1) {
  grid::grid.circle(grid::unit(x, "native"), grid::unit(y, "native"),
                    r = grid::unit(radius, "native"),
                    gp = grid::gpar(fill = color[fill], col = color[stroke], lwd = width))
}

text("Good questions.", 70, 112, 44, "Portfolio Serif")
text("Clearer connections.", 70, 220, 44, "Portfolio Serif", "accent")
line(c(76, 975), c(280, 280))

# The constellation is an abstract wayfinding motif, not observed data.
angles <- seq(0, 2 * pi, length.out = 13)[1:12] - pi / 2
x <- 1340 + 112 * cos(angles)
y <- 170 + 112 * sin(angles)
edges <- rbind(c(1, 4), c(1, 7), c(2, 6), c(2, 9), c(3, 8), c(3, 11),
               c(4, 10), c(5, 9), c(5, 12), c(6, 10), c(7, 11), c(8, 12))
for (i in seq_len(nrow(edges))) line(x[edges[i, ]], y[edges[i, ]], width = .65)
line(x[c(11, 3, 8)], y[c(11, 3, 8)], "accent", 1.5)
for (i in seq_along(x)) {
  selected <- i %in% c(3, 8, 11)
  circle(x[i], y[i], if (selected) 10 else 6,
         fill = if (selected) "accent" else "paper",
         stroke = if (selected) "accent" else "muted", width = .8)
}
circle(1340, 170, 33, stroke = "paper")
text("mb.", 1313, 170, 24, "Portfolio Serif", "accent")
grid::popViewport()
invisible(grDevices::dev.off())
