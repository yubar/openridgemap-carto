@water-color: #aad3df;
@water-border-color: darken(#0066cc, 15%);
@land-color: #f2efe9;

@standard-halo-radius: 2;
@standard-halo-fill: rgba(255,255,255,0.5);

@landform-color: darken(#b46e31, 25%);
@landform-outline-color: darken(#643d1b, 30%);

@ridge-width-4: 1;
@ridge-width-3: 2;
@ridge-width-2: 3;
@ridge-width-1: 4;

@standard-font: @book-fonts;
@standard-font-size: 10;
@standard-wrap-width: 30;
@wide-wrap-width: 45;
@standard-line-spacing-size: -1.5;


#amenity-points {
  [feature = 'peak'], [feature = 'volcano']{
    [zoom >= 12]{
      marker-placement: interior;
      marker-clip: false;

      [feature = 'peak']{
        marker-file: url('symbols/peak.svg');
        marker-fill: @landform-color;
        marker-line-color: #fff;
        marker-line-opacity: 1;
        marker-line-width: 1.25;
      }
      [feature = 'volcano']{
        marker-file: url('symbols/peak.svg');
        marker-fill: #d40000;
      }

      [zoom >= 13]{marker-transform: scale(1.6);}
      [zoom >= 15]{marker-transform: scale(1.7);}
      /*[zoom >= 16]{marker-transform: scale(1.8);}*/
    }
  }
}

#amenity-points {
  [feature = 'peak'][zoom >= 12],
  [feature = 'volcano'][zoom >= 12]{
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(#d40000, 30%);
    [feature = 'volcano'] { text-fill: #d40000; }
    text-dy: 7;
    
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
  }
}


#mountain-passes{
  ::fill {
    [zoom >= 12] {
      marker-file: url('symbols/mountain_pass.svg');
      marker-placement: interior;
      marker-allow-overlap: true;
      marker-clip: false;
      marker-line-color: #000;
      marker-line-width: 0.7;
      marker-transform: rotate([angle]);
      marker-fill: #FFFFFF;
      [rtsa_scale='н/к']{marker-fill: #C9CFCE;}
      [rtsa_scale='1А'],[rtsa_scale='1А*']{marker-fill: #54A951;}
      [rtsa_scale='1Б'],[rtsa_scale='1Б*']{marker-fill: #1388E7;}
      [rtsa_scale='2А'],[rtsa_scale='2А*']{marker-fill: #974EA2;}
      [rtsa_scale='2Б'],[rtsa_scale='2Б*']{marker-fill: #FFFF33;}
      [rtsa_scale='3А'],[rtsa_scale='3А*']{marker-fill: #FF8000;}
      [rtsa_scale='3Б'],[rtsa_scale='3Б*']{marker-fill: #E6191D;}

      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @wide-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      

      text-dx: 10;
      text-dy: 10;
      /*text-face-name: "Liberation Sans Narrow Bold";
      text-fill: lighten(saturate(@landform-color, 30%), 50%);
      text-halo-fill: @landform-outline-color;*/
      text-face-name: @oblique-fonts;
      text-fill: darken(#d40000, 30%);
      text-halo-fill: @standard-halo-fill;

      text-halo-radius: @standard-halo-radius;
      text-placement: interior;
      text-character-spacing: -0.7;
      text-placement-type: simple;
      text-placements: "S,SW,SE,N,NE,NW,W,E";
      [angle >= -22.5][angle < 22.5],[angle < -157.5],[angle >= 157.5] {text-placements: "W,E,SW,SE,NW,NE,S,N,10,9,8";}
      [angle >= 22.5][angle < 67.5],[angle >= -157.5][angle < -112.5] {text-placements: "SE,S,NW,N,W,E,SW,NE,10,9,8";}
      [angle >= 67.5][angle < 112.5],[angle >= -112.5][angle < -67.5] {text-placements: "S,N,SW,SE,NW,NE,W,E,10,9,8";}
      [angle >= 112.5][angle < 157.5],[angle >= -67.5][angle < -22.5] {text-placements: "SW,NE,S,N,W,E,SE,NW,10,9,8";}

      [zoom >= 14]{
        marker-transform: scale(1.4), rotate([angle]);
        text-dx: 12;
        text-dy: 12;
      }
      [zoom >= 15]{
        marker-transform: scale(1.6), rotate([angle]);
        text-dx: 14;
        text-dy: 14;
      }
      [zoom >= 16]{
        marker-transform: scale(1.8), rotate([angle]);
        text-dx: 16;
        text-dy: 16;
      }
    }
  }
}

