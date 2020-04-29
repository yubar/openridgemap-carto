
#ocean-lz {
  polygon-fill: @water-color;
  [zoom <= 6]{ polygon-fill: @water-color-lz; }
}

#ocean {
  [zoom > 6] { polygon-fill: @water-color; }
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
    line-color: @boundary-color-lz;
  }
}

#boundaries{  
  line-color: @boundary-color-mz;
  line-width: 1; 
  [zoom >= 9] { 
    line-width: 2; 
    line-color: @boundary-color;
  }
  [zoom = 10] { line-width: 4; }
  [zoom = 11] { line-width: 6; }
  [zoom >= 12] { line-width: 8; }
}