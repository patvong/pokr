const barColors = {
  // 0 1 2 3 5 8 13 20 40 100 ? coffee
  "coffee": "#000532",
  "?": "#376182",
  "100": "#5e6370",
  "40":  "#a4a0a2",
  "20":  "#ff4265",
  "13":  "#07adeb",
  "8":   "#acdfe8",
  "5":   "#78bac2",
  "3":   "#b4eeb4",
  "2":   "#cbf3ad",
  "1":   "#ffc0cb",
  "0":   "#ffe4e1"
}

export default {
  color(point) {
    return barColors[point]
  }
}