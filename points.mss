@landform-text: #401a10;
@amenity-color: #b00090;


#relief-points {
  [feature = 'peak'], [feature = 'volcano']{
    [zoom >= 12]{
      marker-placement: interior;
      marker-allow-overlap: true;
      marker-clip: false;

      [feature = 'peak']{
        marker-file: url('symbols/peak_otm.png');
        marker-fill: @landform-color;
        marker-line-color: #fff;
        marker-line-opacity: 1;
        marker-line-width: 1.25;
      }
      [feature = 'volcano']{
        marker-file: url('symbols/peak.svg');
        marker-fill: #d40000;
      }
      /*
      [zoom >= 13]{marker-transform: scale(1.6);}
      [zoom >= 15]{marker-transform: scale(1.7);}
      [zoom >= 16]{marker-transform: scale(1.8);}
      */
    }
  }
}


#water-points {
  [feature='rapid'],[feature='waterfall'] {
    [zoom >= 12]{

      [feature='rapid']{marker-file: url('symbols/rapid.svg');}
      [feature='waterfall']{marker-file: url('symbols/waterfall.svg');}

      marker-placement: interior;
      marker-clip: false;
      marker-line-color: @water-border-color;
      marker-line-width: 0.5;
      marker-transform: scale(1.5), rotate([angle]);
      marker-allow-overlap: true;
      
      [feature='rapid'] {
        text-name: "[name]";
        text-size: 9;
        text-face-name: @oblique-fonts;
        text-fill: @water-text;
        text-halo-radius: @water-halo-radius;
        text-halo-fill: @water-halo-fill;
        text-placement: interior;
        text-character-spacing: -0.7;
        text-allow-overlap: true;
        text-dx: 5;
        text-dy: 5;
      }

      [zoom >= 13] {
        marker-transform: scale(2), rotate([angle]);
        [feature='rapid'] {
          text-dx: 7;
          text-dy: 7;
          text-size: 10;
        }
      }
      [zoom >= 14] {
        marker-transform: scale(3), rotate([angle]);
        text-dx: 9;
        text-dy: 9;
        text-name: "[name]";
        text-size: 11;
        text-face-name: @oblique-fonts;
        text-fill: @water-text;
        text-halo-radius: @water-halo-radius;
        text-halo-fill: @water-halo-fill;
        text-placement: interior;
        text-character-spacing: -0.7;
        text-allow-overlap: true;
      }
      [zoom >= 15] {
        marker-transform: scale(3.5), rotate([angle]);
        text-dx: 10;
        text-dy: 10;
        text-size: 12;
      }
    }
  }

  [feature='spring'],[feature='hot_spring'] {
    [zoom >= 12]{
      marker-transform: scale(0.5), translate(0, 9);
      marker-fill: @water-border-color;
      marker-line-color: @standard-halo-fill;
      marker-line-width: 1;
      marker-file: url('symbols/spring.svg');
      marker-allow-overlap: true;
      [feature='hot_spring'] {
        marker-fill: #d40000;
      }
      [zoom >= 15]{
        marker-transform: scale(1), translate(0, 9);
      }
    }
  }
}


#relief-points {
  [feature = 'peak'][zoom >= 12],
  [feature = 'volcano'][zoom >= 12]{
    text-name: "[name]";
    text-size: 9;
    text-wrap-width: 100;
    text-line-spacing: 1;
    text-fill: @landform-text;
    [feature = 'volcano'] { text-fill: #d40000; }
    text-dy: 3;
    
    
    text-face-name: @oblique-fonts;
    text-halo-radius: 1.5;
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
      text-size: 9;
      text-wrap-width: 40;
      text-line-spacing: -1.5;
      

      text-dx: 10;
      text-dy: 10;

      text-face-name: @standard-font;
      text-fill: @landform-text;
      
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1.5;

      text-placement: interior;
      text-character-spacing: -0.7;
      text-placement-type: simple;
      text-placements: "S,SW,SE,N,NE,NW,W,E";
      [angle >= -22.5][angle < 22.5],[angle < -157.5],[angle >= 157.5] {text-placements: "W,E,SW,SE,NW,NE,S,N,10,9,8";}
      [angle >= 22.5][angle < 67.5],[angle >= -157.5][angle < -112.5] {text-placements: "SE,S,NW,N,W,E,SW,NE,10,9,8";}
      [angle >= 67.5][angle < 112.5],[angle >= -112.5][angle < -67.5] {text-placements: "S,N,SW,SE,NW,NE,W,E,10,9,8";}
      [angle >= 112.5][angle < 157.5],[angle >= -67.5][angle < -22.5] {text-placements: "SW,NE,S,N,W,E,SE,NW,10,9,8";}

      [zoom >= 13]{ text-size: 10; }
      [zoom = 14]{
        marker-transform: scale(1.4), rotate([angle]);
        text-dx: 12;
        text-dy: 12;
      }
      [zoom = 15]{
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

#other-points {
  [zoom >= 12]{

    [feature = 'wilderness_hut'] { marker-file: url('symbols/hut_wilderness.svg'); }
    [feature = 'alpine_hut'] { marker-file: url('symbols/hut_alpine.svg'); }
    [feature = 'basic_hut'] { marker-file: url('symbols/hut_basic.svg'); }
    [feature = 'shelter'] { marker-file: url('symbols/hut_shelter.svg'); }
    [feature = 'camp_site'] { marker-file: url('symbols/campsite.svg'); }
    
    marker-line-color: @amenity-color;
    marker-fill: @amenity-color;
    marker-allow-overlap: true;
    
    [feature = 'camp_site'][zoom <= 13] {
      marker-file: url('symbols/campsite_z13.png');
    }
    [zoom = 14]{ marker-transform: scale(1.4); }
    [zoom = 15]{ marker-transform: scale(1.6); }
    [zoom >= 16]{ marker-transform: scale(1.8); }

  }
  
}