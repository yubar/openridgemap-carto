@water-text: @water-border-color;
@glacier: rgba(0,187,255,0.1);
@glacier-line: #389cff;

@waterway-text-repeat-distance: 100;

@water-halo-radius: 1;
@water-halo-fill: rgba(255,255,255,0.7);

@landcover-font-size: 10;
@landcover-wrap-width-size: 30; // 3 em
@landcover-line-spacing-size: -1.5; // -0.15 em
@landcover-font-size-big: 12;
@landcover-wrap-width-size-big: 36; // 3 em
@landcover-line-spacing-size-big: -1.8; // -0.15 em
@landcover-font-size-bigger: 15;
@landcover-wrap-width-size-bigger: 45; // 3 em
@landcover-line-spacing-size-bigger: -2.25; // -0.15 em
@landcover-face-name: @oblique-fonts;

#water-areas {
  [natural = 'glacier']::natural {
    [zoom >= 8] {
      line-width: 0.7;
      line-color: @glacier-line;
      polygon-fill: @glacier;
      [zoom >= 10] {
        line-dasharray: 4,2;
        line-width: 1.0;
      }
    }
  }

  [waterway = 'dock'] {
    [zoom >= 9]::waterway {
      polygon-fill: @water-color;
      [way_pixels >= 4] {
        polygon-gamma: 0.75;
      }
      [way_pixels >= 64] {
        polygon-gamma: 0.6;
      }
    }
  }

  [landuse = 'basin']::landuse {
    [zoom >= 7][way_pixels >= 32],
    [zoom >= 8] {
      [int_intermittent = 'no'] {
        polygon-fill: @water-color;
        [way_pixels >= 4] {
          polygon-gamma: 0.75;
        }
        [way_pixels >= 64] {
          polygon-gamma: 0.6;
        }
      }
      [int_intermittent = 'yes'] {
        polygon-pattern-file: url('symbols/intermittent_water.png');
        [way_pixels >= 4] {
          polygon-pattern-gamma: 0.75;
        }
        [way_pixels >= 64] {
          polygon-pattern-gamma: 0.6;
        }
      }
    }
  }

  [natural = 'water']::natural,
  [landuse = 'reservoir']::landuse,
  [waterway = 'riverbank']::waterway {
    [zoom >= 0][zoom < 1][way_pixels >= 4],
    [zoom >= 1][zoom < 2][way_pixels >= 16],
    [zoom >= 2][zoom < 8][way_pixels >= 32],
    [zoom >= 8] {
      [int_intermittent = 'no'] {
        polygon-fill: @water-color;
        [way_pixels >= 4] {
          polygon-gamma: 0.75;
        }
        [way_pixels >= 64] {
          polygon-gamma: 0.6;
        }
        
        line-color: lighten(@water-border-color, 20%);
        line-width: 0.5;

        [zoom >= 11]{
          line-color: @water-border-color;
          line-width: 1;
        }
      }
      [int_intermittent = 'yes'] {
        polygon-pattern-file: url('symbols/intermittent_water.png');
        [way_pixels >= 4] {
          polygon-pattern-gamma: 0.75;
        }
        [way_pixels >= 64] {
          polygon-pattern-gamma: 0.6;
        }
      }
    }
  }
}

#water-lines-casing {
  [waterway = 'stream'],
  [waterway = 'ditch'],
  [waterway = 'drain'] {
    [int_tunnel = 'no'] {
      [zoom >= 13] {
        line-width: 2.5;
        line-color: white;
        [waterway = 'stream'][zoom >= 15] {
          line-width: 3.5;
        }
        [int_intermittent = 'yes'] {
          line-dasharray: 4,3;
          line-cap: butt;
          line-join: round;
          line-clip: false;
        }
      }
    }
  }
}

#water-lines-low-zoom {
  [waterway = 'river'][zoom >= 8][zoom < 12] {
    [int_intermittent = 'yes'] {
      line-dasharray: 8,4;
      line-cap: butt;
      line-join: round;
      line-clip: false;
    }
    line-color: @water-border-color;
    line-width: 0.7;
    [zoom < 11] {line-color: lighten(@water-border-color, 20%)}
    [zoom >= 9] { line-width: 1.2; }
    [zoom >= 10] { line-width: 1.6; }
  }
}

.water-lines {
  [waterway = 'canal'][zoom >= 12],
  [waterway = 'river'][zoom >= 10],
  [waterway = 'wadi'][zoom >= 12] {
    // the additional line of land color is used to provide a background for dashed casings
    [int_tunnel = 'yes'] {
      background/line-color: @land-color;
      background/line-width: 2;
      background/line-cap: round;
      background/line-join: round;
    }

    [bridge = 'yes'] {
      [zoom >= 14] {
        bridgecasing/line-color: black;
        bridgecasing/line-join: round;
        bridgecasing/line-width: 6;
        [zoom >= 15] { bridgecasing/line-width: 7; }
        [zoom >= 17] { bridgecasing/line-width: 11; }
        [zoom >= 18] { bridgecasing/line-width: 13; }
      }
    }

    water/line-color: @water-border-color;
    water/line-width: 1.5;
    water/line-cap: round;
    water/line-join: round;

    [int_intermittent = 'yes'],
    [waterway = 'wadi'] {
      [bridge = 'yes'][zoom >= 14] {
        bridgefill/line-color: white;
        bridgefill/line-join: round;
        bridgefill/line-width: 4;
        [zoom >= 15] { bridgefill/line-width: 5; }
        [zoom >= 17] { bridgefill/line-width: 9; }
        [zoom >= 18] { bridgefill/line-width: 11; }
      }
      water/line-dasharray: 4,3;
      water/line-cap: butt;
      water/line-join: round;
      water/line-clip: false;
    }

    [zoom >= 13] { water/line-width: 2; }
    [zoom >= 14] { water/line-width: 4; }
    [zoom >= 15] { water/line-width: 5; }
    [zoom >= 17] { water/line-width: 8; }
    [zoom >= 18] { water/line-width: 10; }

    [int_tunnel = 'yes'] {
      [zoom >= 13] { background/line-width: 2; }
      [zoom >= 14] { background/line-width: 4; }
      [zoom >= 15] { background/line-width: 5; }
      [zoom >= 17] { background/line-width: 8; }
      [zoom >= 18] { background/line-width: 10; }

      water/line-dasharray: 4,2;
      background/line-cap: butt;
      background/line-join: miter;
      water/line-cap: butt;
      water/line-join: miter;
      tunnelfill/line-color: #f3f7f7;
      tunnelfill/line-width: 1;
      [zoom >= 14] { tunnelfill/line-width: 2; }
      [zoom >= 15] { tunnelfill/line-width: 3; }
      [zoom >= 17] { tunnelfill/line-width: 7; }
      [zoom >= 18] { tunnelfill/line-width: 8; }
    }
  }

  [waterway = 'stream'],
  [waterway = 'ditch'],
  [waterway = 'drain'] {
    [zoom >= 12] {
      // the additional line of land color is used to provide a background for dashed casings
      [int_tunnel = 'yes'] {
        background/line-width: 2;
        background/line-color: @land-color;
      }
      water/line-width: 1;
      water/line-color: @water-border-color;

      [bridge = 'yes'] {
        [zoom >= 14] {
          bridgecasing/line-color: black;
          bridgecasing/line-join: round;
          bridgecasing/line-width: 4;
          [waterway = 'stream'][zoom >= 15] { bridgecasing/line-width: 4; }
          bridgeglow/line-color: white;
          bridgeglow/line-join: round;
          bridgeglow/line-width: 3;
          [waterway = 'stream'][zoom >= 15] { bridgeglow/line-width: 3; }
        }
      }

      [int_intermittent = 'yes'] {
        water/line-dasharray: 4,3;
        water/line-cap: butt;
        water/line-join: round;
        water/line-clip: false;
      }

      [waterway = 'stream'][zoom >= 15] {
        water/line-width: 3;

        [int_tunnel = 'yes'] {
          background/line-width: 3;
        }
      }
      [int_tunnel = 'yes'][zoom >= 15] {
        background/line-width: 3.5;
        water/line-width: 3.5;
        [waterway = 'stream'] {
          background/line-width: 4.5;
          water/line-width: 4.5;
        }
        water/line-dasharray: 4,2;
        tunnelfill/line-width: 1;
        [waterway = 'stream'] { tunnelfill/line-width: 2; }
        tunnelfill/line-color: #f3f7f7;
      }
    }
  }

}

#water-lines-text {
  [lock = 'yes'][zoom >= 17] {
      text-name: "[lock_name]";
      text-face-name: @oblique-fonts;
      text-placement: line;
      text-fill: @water-text;
      text-spacing: 250;
      text-size: 10;
      text-halo-radius: @water-halo-radius;
      text-halo-fill: @water-halo-fill; 
  }

  [lock != 'yes'][int_tunnel != 'yes'] {
    [waterway = 'river'][zoom >= 11] {
      text-name: "[name]";
      text-size: 12;
      text-face-name: @oblique-fonts;
      text-fill: @water-text;
      text-halo-radius: @water-halo-radius;
      text-halo-fill: @water-halo-fill;
      text-spacing: 250;
      text-placement: line;
      text-repeat-distance: @waterway-text-repeat-distance;
      text-dy: 2;
      [zoom >= 14] { text-size: 14; }
    }

    [waterway = 'canal'][zoom >= 11] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: @water-text;
      text-halo-radius: @water-halo-radius;
      text-halo-fill: @water-halo-fill;
      text-placement: line;
      text-repeat-distance: @waterway-text-repeat-distance;
    }

    [waterway = 'stream'][zoom >= 12] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: @water-text;
      text-halo-radius: @water-halo-radius;
      text-halo-fill: @water-halo-fill;
      text-spacing: 400;
      text-placement: line;
      text-vertical-alignment: middle;
      text-dy: 8;
      text-repeat-distance: @waterway-text-repeat-distance;
    }

    [waterway = 'drain'],
    [waterway = 'ditch'] {
      [zoom >= 13] {
        text-name: "[name]";
        text-size: 10;
        text-face-name: @oblique-fonts;
        text-fill: @water-text;
        text-halo-radius: @water-halo-radius;
        text-halo-fill: @water-halo-fill;
        text-spacing: 400;
        text-placement: line;
        text-vertical-alignment: middle;
        text-dy: 6;
        text-repeat-distance: @waterway-text-repeat-distance;
      }
    }
  }
}

.text[zoom >= 10] {
  [feature = 'natural_water'],
  [feature = 'natural_bay'],
  [feature = 'landuse_reservoir'],
  [feature = 'landuse_basin'],
  [feature = 'waterway_dock'] {
    [zoom >= 0][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: 10;
      text-wrap-width: 25; // 2.5 em
      text-line-spacing: -1.5; // -0.15 em
      [way_pixels > 12000] {
        text-size: 12;
        text-wrap-width: 37; // 3.1 em
        text-line-spacing: -1.6; // -0.13 em
      }
      [way_pixels > 48000] {
        text-size: 15;
        text-wrap-width: 59; // 3.9 em
        text-line-spacing: -1.5; // -0.10 em
      }
      [way_pixels > 192000] {
        text-size: 19;
        text-wrap-width: 95; // 5.0 em
        text-line-spacing: -0.95; // -0.05 em
      }
      text-fill: @water-text;
      text-face-name: @oblique-fonts;
      text-halo-radius: @water-halo-radius;
      text-halo-fill: @water-halo-fill;
      text-placement: interior;
    }
  }
  [feature = 'natural_glacier']{
    [zoom >= 10][way_pixels > 750],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@glacier-line, 30%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @water-halo-radius;
      text-halo-fill: @water-halo-fill;
      text-placement: interior;
    }
  }
  
}

#whitewater-rapids {
  [zoom >= 12] {
    marker-file: url('symbols/rapid.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-line-color: @water-border-color;
    marker-line-width: 0.5;
    marker-transform: scale(2), rotate([angle]);
    marker-allow-overlap: true;
    

    text-name: "[name]";
    text-size: 10;
    text-face-name: @oblique-fonts;
    text-fill: @water-text;
    text-halo-radius: @water-halo-radius;
    text-halo-fill: @water-halo-fill;

    text-placement: interior;
    text-character-spacing: -0.7;

    text-allow-overlap: true;
    
    /*
    text-placement-type: simple;
    text-placements: "S,SW,SE,N,NE,NW,W,E";
    
    [angle >= -22.5][angle < 22.5],[angle < -157.5],[angle >= 157.5] {text-placements: "W,E,SW,SE,NW,NE,S,N,10,9,8";}
    [angle >= 22.5][angle < 67.5],[angle >= -157.5][angle < -112.5] {text-placements: "SE,S,NW,N,W,E,SW,NE,10,9,8";}
    [angle >= 67.5][angle < 112.5],[angle >= -112.5][angle < -67.5] {text-placements: "S,N,SW,SE,NW,NE,W,E,10,9,8";}
    [angle >= 112.5][angle < 157.5],[angle >= -67.5][angle < -22.5] {text-placements: "SW,NE,S,N,W,E,SE,NW,10,9,8";}
    */
    text-dx: 5;
    text-dy: 5;

    [zoom >= 13] {
      marker-transform: scale(2.5), rotate([angle]);
      text-dx: 7;
      text-dy: 7;
      text-size: 11;
    }
    [zoom >= 14] {
      marker-transform: scale(3), rotate([angle]);
      text-dx: 9;
      text-dy: 9;
    }
    [zoom >= 15] {
      marker-transform: scale(3.5), rotate([angle]);
      text-dx: 10;
      text-dy: 10;
      text-size: 12;
    }
    
  }
}