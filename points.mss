@landform-text: #401a10;
@amenity-color: #b00090;
@city-halo-fill: @standard-halo-fill;

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
      marker-ignore-placement: true;
      
      [feature='rapid'] {
        text-name: "[name]";
        text-size: 9;
        text-face-name: @oblique-fonts;
        text-fill: @water-text;
        text-halo-radius: @water-halo-radius;
        text-halo-fill: @water-halo-fill;
        text-placement: interior;
        text-character-spacing: -0.7;
        text-allow-overlap: false;
        text-dx: 8;
        text-dy: 8;
        text-placement-type: simple;
        text-placements: "S,SW,SE,N,NE,NW,W,E";
        [angle >= -22.5][angle < 22.5],[angle < -157.5],[angle >= 157.5] {text-placements: "W,E,SW,NE,SE,NW,S,N,10,9,8";}
        [angle >= 22.5][angle < 67.5],[angle >= -157.5][angle < -112.5] {text-placements: "SE,S,NW,N,W,E,SW,NE,10,9,8";}
        [angle >= 67.5][angle < 112.5],[angle >= -112.5][angle < -67.5] {text-placements: "S,N,SE,NW,SW,NE,W,E,10,9,8";}
        [angle >= 112.5][angle < 157.5],[angle >= -67.5][angle < -22.5] {text-placements: "SW,NE,S,N,W,E,SE,NW,10,9,8";}
      }

      [zoom >= 13] {
        marker-transform: scale(1.75), rotate([angle]);
        [feature='rapid'] {
          text-dx: 9;
          text-dy: 9;
          text-size: 10;
        }
      }
      [zoom >= 14] {
        marker-transform: scale(2), rotate([angle]);
        text-dx: 10;
        text-dy: 10;
        text-name: "[name]";
        text-size: 11;
        text-face-name: @oblique-fonts;
        text-fill: @water-text;
        text-halo-radius: @water-halo-radius;
        text-halo-fill: @water-halo-fill;
        text-placement: interior;
        text-character-spacing: -0.7;
        text-allow-overlap: true;
        text-placement-type: simple;
        text-placements: "S,SW,SE,N,NE,NW,W,E";
        [angle >= -22.5][angle < 22.5],[angle < -157.5],[angle >= 157.5] {text-placements: "W,E,SW,NE,SE,NW,S,N,10,9,8";}
        [angle >= 22.5][angle < 67.5],[angle >= -157.5][angle < -112.5] {text-placements: "SE,S,NW,N,W,E,SW,NE,10,9,8";}
        [angle >= 67.5][angle < 112.5],[angle >= -112.5][angle < -67.5] {text-placements: "S,N,SE,NW,SW,NE,W,E,10,9,8";}
        [angle >= 112.5][angle < 157.5],[angle >= -67.5][angle < -22.5] {text-placements: "SW,NE,S,N,W,E,SE,NW,10,9,8";}
      }
      [zoom >= 15] {
        marker-transform: scale(3), rotate([angle]);
        text-dx: 10;
        text-dy: 10;
        text-size: 12;
      }
    }
  }

  [feature='spring'],[feature='hot_spring'] {
    [zoom >= 12]{
      marker-transform: scale(0.6), translate(0, 9);
      marker-fill: @water-border-color;
      marker-line-color: @standard-halo-fill;
      marker-line-width: 1;
      marker-file: url('symbols/spring.svg');
      marker-allow-overlap: true;
      marker-ignore-placement: true;
      [feature='hot_spring'] {
        marker-fill: #d40000;
      }
      [zoom >= 15]{
        marker-transform: scale(0.75), translate(0, 9);
      }
    }
  }
}

#relief-points{
  [feature = 'pass'][zoom >= 11] {
    marker-file: url('symbols/mountain_pass.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-line-color: #000;
    marker-line-width: 0.5;
    marker-transform: rotate([angle]);
    marker-fill: #FFF;
    [scale='н/к']{marker-fill: #DDD;}
    [scale='1А'],[scale='1А*']{marker-fill: #17c638;}
    [scale='1Б'],[scale='1Б*']{marker-fill: #28b3ff;}
    [scale='2А'],[scale='2А*']{marker-fill: #e9eb00;}
    [scale='2Б'],[scale='2Б*']{marker-fill: #ff8800;}
    [scale='3А'],[scale='3А*']{marker-fill: #ff63f5;}
    [scale='3Б'],[scale='3Б*']{marker-fill: #ff3c32;}

    [zoom >= 12] {
      marker-allow-overlap: true; 
      
    }

    [zoom = 14]{
      marker-transform: scale(1.4), rotate([angle]);
    }
    [zoom = 15]{
      marker-transform: scale(1.6), rotate([angle]);
    }
    [zoom >= 16]{
      marker-transform: scale(1.8), rotate([angle]);
    }
  }

  [feature = 'peak'], [feature = 'volcano']{
    [zoom >= 11]{
      marker-placement: interior;
      marker-allow-overlap: false;
      marker-clip: false;

      [feature = 'peak']{
        marker-file: url('symbols/peak_otm.png');
        marker-fill: @landform-color;
      }
      [feature = 'volcano']{
        marker-file: url('symbols/peak.svg');
        marker-fill: #d40000;
      }
    }
  }
}

#relief-points-text{
    
    [feature = 'peak'],[feature = 'volcano']{
      [zoom >= 12]{
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

    [feature = 'pass']{
      [zoom >= 12] {
          text-name: "[short_name]";
          text-size: 9;
          text-wrap-width: 40;
          text-line-spacing: -1.5;
          text-character-spacing: -0.7;
          text-allow-overlap: "false";
          text-face-name: @standard-font;
          text-fill: @landform-text;
          text-halo-fill: rgba(255, 255, 255, 0.8);
          text-halo-radius: 1.5;

          text-dx: 8;
          text-dy: 8;
          text-margin:12;
          text-placement: interior;

          text-placement-type: simple;
          text-placements: "S,SW,SE,N,NE,NW,W,E";
          [angle >= -22.5][angle < 22.5],[angle < -157.5],[angle >= 157.5] {text-placements: "W,E,SW,NE,SE,NW,S,N,10,9,8";}
          [angle >= 22.5][angle < 67.5],[angle >= -157.5][angle < -112.5] {text-placements: "SE,S,NW,N,W,E,SW,NE,10,9,8";}
          [angle >= 67.5][angle < 112.5],[angle >= -112.5][angle < -67.5] {text-placements: "S,N,SE,NW,SW,NE,W,E,10,9,8";}
          [angle >= 112.5][angle < 157.5],[angle >= -67.5][angle < -22.5] {text-placements: "SW,NE,S,N,W,E,SE,NW,10,9,8";}
      }

      [zoom >= 13]{ 
        text-name: "[name]";
        text-size: 10; 
        text-dx: 8;
        text-dy: 8;
      }
      [zoom = 14]{
        text-dx: 10;
        text-dy: 10;
      }
      [zoom = 15]{
        text-dx: 12;
        text-dy: 12;
      }
      [zoom >= 16]{
        text-dx: 14;
        text-dy: 14;
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
    marker-allow-overlap: false;
    
    [feature = 'camp_site'][zoom <= 13] {
      marker-file: url('symbols/campsite_z13.png');
    }
    [zoom = 14]{ marker-transform: scale(1.4); }
    [zoom = 15]{ marker-transform: scale(1.6); }
    [zoom >= 16]{ marker-transform: scale(1.8); }

  }
  
}

#cities {

  [zoom = 3]{
    [admin_level = 2], [population >= 1000000], [ppliso > 500000]{

      point-file: url('symbols/city_small2.png');
      text-size: 10;
      text-fill: #000;
      text-halo-fill: @city-halo-fill;
      text-wrap-width: 100;
      text-halo-radius: 1;
      text-placement: interior;
      text-name: "[name]";
      text-face-name: @condensed-sans-fonts;
      text-dx: 4;
      text-dy: 4;
      text-placement-type: simple;
      text-placements: "S,SE,SW,E,W,N,NE,NW";
      text-avoid-edges: true;

      [admin_level = 2] {
        point-file: url('symbols/city_small.png');
      }

      [admin_level != 2][population >= 1000000] {
        point-file: url('symbols/town_z8_crop.png');
        text-dy: 5;
      }
      
      [admin_level != 2][population >= 100000][population < 1000000] {
        point-file: url('symbols/city3lz.png');
        text-size: 9;
        text-face-name: @condensed-italic-sans-fonts;
      }
      [admin_level != 2][population < 100000] {
        point-file: url('symbols/city_small2_crop.png');
        text-size: 9;
        text-dx: 2;
        text-dy: 2;
        text-face-name: @condensed-italic-sans-fonts;
      }
    }
  }

  [zoom = 4]{
    
      [admin_level = 2] {
        point-file: url('symbols/city_small.png');
        text-size: 10;
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 100;
        text-halo-radius: 1;
        text-placement: interior;
        text-face-name: @condensed-bold-sans-fonts;
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='0' dy='4' /><Placement dx='4' dy='-3' /><Placement dx='4' dy='3' /><Placement dx='-3' dy='2' /><![CDATA["; 
      }

      [admin_level != 2][population >= 1000000] {
        point-file: url('symbols/town_z8_crop.png');
        text-size: 10;
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 100;
        text-halo-radius: 1;
        text-placement: interior;
        text-face-name: @condensed-sans-fonts;
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='0' dy='4' /><Placement dx='4' dy='-3' /><Placement dx='4' dy='3' /><Placement dx='-3' dy='2' /><![CDATA["; 
      }

      [admin_level != 2][population < 1000000][ppliso > 250000] {
        
        point-file: url('symbols/city_small2_crop.png');
        [population >= 50000] { point-file: url('symbols/city3lz.png'); }
        text-size: 9;
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 50;
        text-halo-radius: 1.5;
        text-placement: interior;
        text-face-name: @condensed-italic-sans-fonts;

        text-placement-type: list;
        text-name: "[name]]]><Placement dx='4' dy='-2' /><Placement dx='3' dy='2' /><Placement dx='0' dy='-5' /><Placement dx='0' dy='2' /><![CDATA["; 
        text-avoid-edges: true;
      }

  }

  [zoom = 5]{
    [admin_level = 2][population > 100000],[population >= 250000]{

      [admin_level = 2], [population >= 1000000] {
        point-file: url('symbols/city_small.png');
        text-face-name: @condensed-bold-sans-fonts;
         text-name: "[name]]]><Placement dx='5' dy='-3' /><Placement dx='0' dy='5' /><Placement dx='5' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><Placement dx='-5' dy='5' /><![CDATA["; 
      }

      [admin_level = 2] { 
        text-transform: uppercase; 
        text-size: 12;
      }

      [admin_level != 2][population < 1000000] {
        point-file: url('symbols/town_z8.png');
        text-name: "[name]]]><Placement dx='5' dy='-3' /><Placement dx='0' dy='5' /><Placement dx='5' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><Placement dx='-5' dy='5' /><![CDATA["; 
      }

      text-size: 10;
      text-fill: #000;
      text-halo-fill: @city-halo-fill;
      text-wrap-width: 100;
      text-halo-radius: 2;
      text-placement: interior;
      text-placement-type: list;
      text-face-name: @condensed-sans-fonts;
      text-name: "[name]]]><Placement dx='5' dy='-4' /><Placement dx='0' dy='7' /><Placement dx='5' dy='3' /><Placement dx='-5' dy='5' /><![CDATA["; 
    }

    [admin_level != 2][population < 250000][ppliso > 100000]{
        point-file: url('symbols/city_small2_crop.png');
        text-size: 9;
        [population >= 20000] { 
          point-file: url('symbols/city3lz.png'); 
          text-size: 10;
        }
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 50;
        text-halo-radius: 1.5;
        text-placement: interior;
        text-face-name: @condensed-italic-sans-fonts;
        [place='city'],[place='town']{ text-face-name: @condensed-sans-fonts; }
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='3' dy='-2' /><Placement dx='3' dy='2' /><Placement dx='0' dy='-5' /><Placement dx='0' dy='2' /><![CDATA["; 
    }

  }

  [zoom = 6]{

    [admin_level = 2][population > 25000], [population > 100000]{

      [population >= 1000000] {
        point-file: url('symbols/city_small.png');
        text-face-name: @condensed-bold-sans-fonts
      }

      [admin_level != 2][population > 100000][population < 1000000] {
        point-file: url('symbols/town_z8.png');

        [population < 400000] { 
          text-size: 9;
        }
      }

      
      [admin_level = 2] { 
        point-file: url('symbols/city.png');
        text-face-name: @condensed-bold-sans-fonts; 
        text-transform: uppercase; 
        text-size: 12;
        text-name: "[name]]]><Placement dx='5' dy='-4' /><Placement dx='0' dy='7' /><Placement dx='5' dy='3' /><Placement dx='-5' dy='5' /><![CDATA["; 
      }

      text-name: "[name]]]><Placement dx='5' dy='-3' /><Placement dx='0' dy='5' /><Placement dx='5' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><Placement dx='-5' dy='5' /><![CDATA[";
      text-face-name: @condensed-sans-fonts;
      text-size: 10;
      text-fill: #000;
      text-halo-fill: @city-halo-fill;
      text-wrap-width: 100;
      text-halo-radius: 2;
      text-placement: interior;
      text-placement-type: list;
    }

    [admin_level != 2][population < 100000][ppliso > 50000]{
        point-file: url('symbols/city_small2_crop.png');
        [population >= 10000] { 
          point-file: url('symbols/city3lz.png'); 
          text-size: 9;
        }
        text-size: 9;
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 50;
        text-halo-radius: 1.5;
        text-placement: interior;
        text-face-name: @condensed-italic-sans-fonts;
        [place='city'],[place='town']{ text-face-name: @condensed-sans-fonts; }
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='3' dy='-2' /><Placement dx='3' dy='2' /><Placement dx='0' dy='-5' /><Placement dx='0' dy='2' /><![CDATA["; 
        text-avoid-edges: true;
    }
  }

  [zoom = 7]{

    [admin_level = 2][population > 25000], [place='city'], [population > 50000]{

      text-name: "[name]";

      [admin_level = 2][population > 25000]{ 
        point-file: url('symbols/city.png');
        text-face-name: @condensed-bold-sans-fonts; 
        text-transform: uppercase; 
        text-size: 13;
        text-wrap-width: 100;
        text-name: "[name]]]><Placement dx='5' dy='-4' /><Placement dx='0' dy='7' /><Placement dx='5' dy='3' /><Placement dx='-5' dy='5' /><![CDATA["; 
      }

      [admin_level != 2][population >= 1000000] {
        point-file: url('symbols/city.png');
        text-size: 14;
        text-wrap-width: 100;
        text-name: "[name]]]><Placement dx='4' dy='-3' /><Placement dx='0' dy='4' /><Placement dx='4' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><Placement dx='-4' dy='5' /><![CDATA["; 
      }

      [place='city'][admin_level != 2][population < 1000000] {
        
        point-file: url('symbols/town_z8.png');
        text-size: 11;
        text-wrap-width: 100;
        text-name: "[name]]]><Placement dx='4' dy='-2' /><Placement dx='0' dy='4' /><Placement dx='4' dy='2' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><Placement dx='-4' dy='5' /><![CDATA["; 

        [population >= 100000]{
          point-file: url('symbols/city_small.png');
          text-size: 12;
          text-wrap-width: 100;
          text-name: "[name]]]><Placement dx='5' dy='-3' /><Placement dx='0' dy='5' /><Placement dx='5' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><Placement dx='-5' dy='5' /><![CDATA[";
        }
      }

      [place='town'][population >= 50000]{
        point-file: url('symbols/town_z8.png');
        text-size: 9;
        text-wrap-width: 70;
        text-wrap-before: "true";
        text-name: "[name]]]><Placement dx='5' dy='-3' /><Placement dx='0' dy='5' /><Placement dx='5' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><![CDATA[";
      }

      text-face-name: @condensed-sans-fonts;
      text-fill: #000;
      text-halo-fill: @city-halo-fill;
      text-halo-radius: 2;
      text-placement: interior;
      text-placement-type: list;
    }

    [admin_level != 2][place!='city'][population < 50000][ppliso > 30000]{
        
        point-file: url('symbols/city_small2_crop.png');

        [population >= 5000] { 
          point-file: url('symbols/city3lz.png'); 
          text-size: 9;
        }
        text-size: 9;
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 50;
        text-halo-radius: 1.5;
        text-placement: interior; 
        text-face-name: @condensed-italic-sans-fonts;
        [place='town']{ 
          text-face-name: @condensed-sans-fonts; 
        }
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='3' dy='-2' /><Placement dx='3' dy='2' /><Placement dx='0' dy='-5' /><Placement dx='0' dy='2' /><![CDATA["; 
    }

  }

  [zoom = 8]{

    [place='city'], [place='town'][population >= 25000]{

      text-name: "[name]";
      text-face-name: @condensed-sans-fonts;

      [place='city']{
        
        point-file: url('symbols/city.png');
        text-wrap-width: 100;

        [admin_level = 2][population > 10000]{ 
          text-face-name: @condensed-bold-sans-fonts; 
          text-transform: uppercase; 
          text-size: 15;
          text-name: "[name]]]><Placement dx='4' dy='-4' /><Placement dx='0' dy='4' /><Placement dx='4' dy='4' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='5' /><Placement dx='-4' dy='4' /><![CDATA["; 
        }

        [admin_level != 2][population >= 1000000] {
          text-face-name: @condensed-sans-fonts; 
          text-size: 14;
          text-name: "[name]]]><Placement dx='4' dy='-3' /><Placement dx='0' dy='4' /><Placement dx='4' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><Placement dx='-4' dy='5' /><![CDATA["; 
        }

        [admin_level != 2][population < 1000000] {
          text-face-name: @condensed-sans-fonts; 
          text-size: 13;
          text-name: "[name]]]><Placement dx='5' dy='-4' /><Placement dx='0' dy='7' /><Placement dx='5' dy='3' /><Placement dx='-5' dy='5' /><![CDATA["; 
        }
      }

      [place='town'][population >= 25000]{
        point-file: url('symbols/town_z8.png');
        text-face-name: @condensed-sans-fonts;
        text-size: 10;
        text-wrap-width: 75;
        text-wrap-before: "true";
        text-name: "[name]]]><Placement dx='5' dy='-3' /><Placement dx='0' dy='5' /><Placement dx='5' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><![CDATA[";
      }

      text-fill: #000;
      text-halo-fill: @city-halo-fill;
      text-halo-radius: 2;
      text-placement: interior;
      text-placement-type: list;
    }

    [admin_level != 2][place!='city'][population < 25000][ppliso > 15000]{
        point-file: url('symbols/city_small2_crop.png');
        [population >= 2500] { 
          point-file: url('symbols/city3lz.png'); 
          text-size: 10;
        }
        text-size: 9;
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 50;
        text-halo-radius: 1.5;
        text-placement: interior;
        text-face-name: @condensed-italic-sans-fonts;
        [place='town']{ text-face-name: @condensed-sans-fonts;}
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='3' dy='-2' /><Placement dx='3' dy='2' /><Placement dx='0' dy='-5' /><Placement dx='0' dy='2' /><![CDATA["; 
    }
  }

  [zoom = 9]{

    [place='city'], [place='town'][population >= 10000]{

      text-name: "[name]";
      text-face-name: @condensed-sans-fonts;

      [place='city']{
        
        point-file: url('symbols/city.png');
        text-wrap-width: 100;
        text-face-name: @condensed-bold-sans-fonts; 
        
        text-dx: "10";
        text-dy: "5";
        text-name: "[name]";
        text-placement: interior;
        text-placement-type: simple;
        text-placements: "NE, N, NW";

        [admin_level = 2]{ 
          text-transform: uppercase; 
          text-size: 16;
        }

        [admin_level != 2]{
          text-face-name: @condensed-sans-fonts; 
          text-size: 15;
        }
      }

      [place='town']{
        point-file: url('symbols/town.png');
        text-face-name: @condensed-sans-fonts;
        text-size: 10;
        text-wrap-width: 80;
        text-wrap-before: "true";
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='5' dy='-3' /><Placement dx='0' dy='5' /><Placement dx='5' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><![CDATA[";
        [population > 50000] { text-size: 12; }
      }

      text-fill: #000;
      text-halo-fill: @city-halo-fill;
      text-halo-radius: 2;
      text-placement: interior;
      
    }

    [place!='city'][population < 10000][ppliso > 10000]{
        point-file: url('symbols/city_small2_crop.png');
        [population >= 1000] { 
          point-file: url('symbols/city3lz.png'); 
          text-size: 10;
        }
        text-size: 9;
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 50;
        text-halo-radius: 1.5;
        text-placement: interior;
        text-face-name: @condensed-italic-sans-fonts;
        [place='town']{ text-face-name: @condensed-sans-fonts;}
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='3' dy='-2' /><Placement dx='3' dy='2' /><Placement dx='0' dy='-5' /><Placement dx='0' dy='2' /><![CDATA["; 
    }
  }

  [zoom = 10]{

    [place='city'], [place='town'][population > 5000]{

      text-name: "[name]";
      text-face-name: @condensed-sans-fonts;

      [place='city']{
        
        point-file: url('symbols/city.png');
        
        text-wrap-width: 100;
        text-face-name: @condensed-bold-sans-fonts; 
        text-dx: "11";
        text-dy: "6";
        text-name: "[name]";
        text-placement: interior;
        text-placement-type: simple;
        text-placements: "NE, N, NW";

        [admin_level = 2]{ 
          text-transform: uppercase; 
          text-size: 18;
        }

        [admin_level != 2]{
          text-face-name: @condensed-sans-fonts; 
          text-size: 17;
        }
      }

      [place='town']{
        point-file: url('symbols/town.png');
        text-face-name: @condensed-sans-fonts;
        text-wrap-before: "true";
        text-placement-type: list;
        text-name: "[name]";

        [population >= 50000] { 
          text-size: 13; 
          text-wrap-width: 120;
          text-name: "[name]]]><Placement dx='7' dy='-5' /><Placement dx='0' dy='7' /><Placement dx='7' dy='5' /><Placement dx='0' dy='-8' /><Placement dx='-5' dy='6' /><![CDATA[";
        }
        [population >= 10000][population < 50000] { 
          text-size: 12; 
          text-wrap-width: 80;
          text-name: "[name]]]><Placement dx='6' dy='-4' /><Placement dx='0' dy='6' /><Placement dx='6' dy='4' /><Placement dx='0' dy='-7' /><Placement dx='-4' dy='5' /><![CDATA[";
        }
        [population < 10000] {
          text-size: 10;
          text-wrap-width: 75;
          text-name: "[name]]]><Placement dx='4' dy='-3' /><Placement dx='0' dy='4' /><Placement dx='4' dy='3' /><Placement dx='0' dy='-6' /><Placement dx='-3' dy='4' /><![CDATA["; 
        }
      }

      text-fill: #000;
      text-halo-fill: @city-halo-fill;
      text-halo-radius: 2;
      text-placement: interior;
      
    }

    [place='town'][population < 5000], [place!='city'][place!='town'][ppliso > 2000]{
        point-file: url('symbols/city_small2_crop.png');
        [population >= 500] { 
          point-file: url('symbols/city3lz.png'); 
          text-size: 10;
        }
        text-size: 9;
        text-fill: #000;
        text-halo-fill: @city-halo-fill;
        text-wrap-width: 50;
        text-halo-radius: 1.5;
        text-placement: interior;
        text-face-name: @condensed-italic-sans-fonts;
        [place='town']{ text-face-name: @condensed-sans-fonts;}
        text-placement-type: list;
        text-name: "[name]]]><Placement dx='3' dy='-2' /><Placement dx='3' dy='2' /><Placement dx='0' dy='-5' /><Placement dx='0' dy='2' /><![CDATA["; 
    }
  }
}
