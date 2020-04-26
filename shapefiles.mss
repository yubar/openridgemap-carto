#ocean-lz {
  polygon-fill: @water-color;
  [zoom <= 6]{ polygon-fill: @water-color-lz; }
}

#ocean {
  polygon-fill: @water-color;
}

#necountries {
  [zoom >= 1][zoom < 5] {
    line-width: 0.2;
    [zoom >= 2] {
      line-width: 0.3;
    }
    [zoom >= 3] {
      line-width: 0.4;
    }
    line-color: @admin-boundaries;
  }
}