library(hexSticker)

base <- "https://www.basis-europe.eu/wp-content/uploads/openjdk_Icon_logo.png"

# for windows
sticker(
  base,
  s_x = 1,
  s_y = 0.8,
  s_width=0.5,
  s_height=0.5,
  package = "correttor",
  p_size = 18,
  p_y = 1.5,
  filename = "man/figures/logo.png",
  h_fill = "#FFFFFF",
  p_color = "#25303E",
  h_color = "#F25D5A",
  url = "mrchypark.github.io/correttor",
  u_size = 5,
  u_color = "#CACACA"
)


