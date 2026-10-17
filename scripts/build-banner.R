# Run from the repository root: Rscript scripts/build-banner.R
# Optional first argument: directory containing the two Lora font files.
# The illustration is an original conceptual map, not customer or measured data.
if (!requireNamespace("ragg", quietly = TRUE) ||
    !requireNamespace("systemfonts", quietly = TRUE)) {
  stop("Install ragg and systemfonts to rebuild the profile banner.")
}

args <- commandArgs(trailingOnly = TRUE)
font_dir <- if (length(args)) args[1] else file.path("scripts", "fonts")
fonts <- file.path(font_dir, c("Lora-Regular.ttf", "Lora-Italic.ttf"))
if (!all(file.exists(fonts))) {
  stop("The font directory must contain Lora-Regular.ttf and Lora-Italic.ttf.")
}
systemfonts::register_font("Banner Lora", plain = fonts[1], italic = fonts[2])

color <- c(paper = "#F7F3EA", ink = "#203C49", teal = "#236D70",
           mist = "#B8CCC5", faint = "#E3E5D9", gold = "#BC8250")
dir.create("assets", showWarnings = FALSE)
ragg::agg_png("assets/profile-banner.png", width = 1680, height = 440,
              units = "px", res = 144, background = color["paper"])
grid::grid.newpage()
grid::pushViewport(grid::viewport(xscale = c(0, 1680), yscale = c(440, 0)))

line <- function(x, y, fill = "mist", width = 1, ...) {
  grid::grid.lines(grid::unit(x, "native"), grid::unit(y, "native"),
                  gp = grid::gpar(col = color[fill], lwd = width,
                                  lineend = "round", ...))
}
circle <- function(x, y, radius, fill = "paper", stroke = "mist", width = 1) {
  grid::grid.circle(grid::unit(x, "native"), grid::unit(y, "native"),
                    r = grid::unit(radius, "native"),
                    gp = grid::gpar(fill = color[fill], col = color[stroke],
                                    lwd = width))
}
text <- function(label, x, y, size, fill, italic = FALSE) {
  grid::grid.text(label, x = grid::unit(x, "native"), y = grid::unit(y, "native"),
                  just = "left",
                  gp = grid::gpar(fontfamily = "Banner Lora",
                                  fontface = if (italic) "italic" else "plain",
                                  fontsize = size, col = color[fill]))
}
bezier <- function(points, fill, width = 1) {
  t <- seq(0, 1, length.out = 240)
  basis <- cbind((1 - t)^3, 3 * (1 - t)^2 * t, 3 * (1 - t) * t^2, t^3)
  xy <- basis %*% points
  line(xy[, 1], xy[, 2], fill, width)
  invisible(xy)
}

text("Good questions.", 78, 156, 39, "ink")
text("Clearer connections.", 78, 260, 39, "teal", italic = TRUE)

line(c(82, 174), c(347, 347), "gold", 1.5)
circle(184, 347, 3, fill = "gold", stroke = "gold", width = .5)

theta <- seq(-1.23, 4.17, length.out = 240)
line(1334 + 171 * cos(theta), 220 + 151 * sin(theta), "faint", 1)
theta <- seq(-.52, 2.4, length.out = 140)
line(1334 + 189 * cos(theta), 220 + 168 * sin(theta), "faint", .7)

path_a <- bezier(rbind(c(1091, 296), c(1190, 349),
                      c(1440, 62), c(1560, 143)), "teal", 1.7)
path_b <- bezier(rbind(c(1114, 123), c(1329, 14),
                      c(1284, 397), c(1548, 291)), "ink", 1.2)
path_c <- bezier(rbind(c(1153, 332), c(1090, 128),
                      c(1559, 99), c(1511, 331)), "mist", 1.2)

# A paper-width interruption makes the central crossing read as woven threads.
distance <- outer(path_a[, 1], path_b[, 1], "-")^2 +
            outer(path_a[, 2], path_b[, 2], "-")^2
crossing <- arrayInd(which.min(distance), dim(distance))[1]
overpass <- seq.int(max(1, crossing - 4), min(nrow(path_a), crossing + 4))
line(path_a[overpass, 1], path_a[overpass, 2], "paper", 5)
line(path_a[overpass, 1], path_a[overpass, 2], "teal", 1.7)

for (idx in c(16, 56, 105, 179, 223)) {
  p <- path_a[idx, ]
  circle(p[1], p[2], 4, stroke = "teal", width = 1)
}
for (idx in c(23, 77, 165, 223)) {
  p <- path_b[idx, ]
  circle(p[1], p[2], 3, fill = "ink", stroke = "ink", width = .5)
}
for (idx in c(24, 99, 176, 228)) {
  p <- path_c[idx, ]
  circle(p[1], p[2], 3, stroke = "mist", width = .8)
}

p <- path_a[143, ]
circle(p[1], p[2], 16, stroke = "gold", width = .7)
circle(p[1], p[2], 6, fill = "gold", stroke = "gold", width = .7)

grid::popViewport()
invisible(grDevices::dev.off())
