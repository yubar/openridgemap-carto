@water-text: @water-border-color;
@glacier: rgba(0,187,255,0.1);
@glacier-lowzoom: rgba(0,187,255,0.2);
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

#waterways {

  [feature = 'river']
  ,[feature = 'canal']{
  	[zoom >= 8]{

	  	[intermittent = 1] {
		    line-dasharray: 8,4; 
		    line-cap: butt;
		    line-join: round;
		    line-clip: false;
		}

	    line-color: @water-border-color;
	    [zoom < 11] {line-color: lighten(@water-border-color, 20%)}

		line-width: 0.7;
		[zoom >= 9]  { line-width: 1.2; }
	    [zoom >= 10] { line-width: 1.5; }
	    [zoom >= 13] { line-width: 2; }
	    [zoom >= 14] { line-width: 4; }
	    [zoom >= 15] { line-width: 5; }
	    [zoom >= 17] { line-width: 8; }
	    [zoom >= 18] { line-width: 10; }

	    
    }
  }

  [feature = 'stream'],
  [feature = 'ditch'],
  [feature = 'wadi'],
  [feature = 'drain'] {

  	[intermittent != 1][zoom >= 11] {

	  	line-color: @water-border-color;
  		[zoom <= 12] {line-width: 0.5;}
  		[zoom >= 13] {line-width: 1;}
		[zoom >= 15] {line-width: 3;}

  	}

  	[intermittent = 1] [zoom >= 13] {

  		line-color: @water-border-color;
	    line-dasharray: 8,4; 
	    line-cap: butt;
	    line-join: round;
	    line-clip: false;
	 }

  }
}

#waterareas {
    [zoom >= 0][zoom < 1][areapx >= 2],
    [zoom >= 1][zoom < 2][areapx >= 8],
    [zoom >= 2][zoom < 8][areapx >= 16],
    [zoom >= 8][zoom < 14][areapx >= 32],
    [zoom >= 14]{

    	[feature = 'glacier'] {
    		polygon-fill: @glacier-lowzoom;

    		[zoom >= 10]{
				line-width: 0.5;
				line-color: @glacier-line;
				polygon-fill: @glacier;
			}
			[zoom >= 11] {
				line-dasharray: 4,2;
				line-width: 1.0;
      		}
  		}

      	[feature != 'glacier'][intermittent != 1] {
        	polygon-fill: darken(@water-color, 15%);
				
	        [zoom >= 7]{
	        	line-color: lighten(@water-border-color, 20%);
	        	polygon-fill: @water-color;
	        	line-width: 0.3;
	        }
	        [zoom >= 9]{line-width: 0.5;}
	        [zoom >= 11]{
	          line-color: @water-border-color;
	          line-width: 1;
	        }
    	
      	}
      	[feature != 'glacier'][intermittent = 1] {
	        polygon-pattern-file: url('symbols/intermittent_water.png');
    	}
    }


    [areapx >= 1000] {
		text-name: "[name]";
		text-size: 10;
		text-fill: @water-text;
		text-face-name: @oblique-fonts;
		text-halo-radius: @water-halo-radius;
		text-halo-fill: @water-halo-fill;
		text-placement: interior;
		text-wrap-width: 50;
    }
}


#waterways {
	[feature = 'stream'],
	[feature = 'ditch'],
	[feature = 'wadi'],
	[feature = 'drain']{
		[intermittent != 1][zoom >= 11]{

			text-name: "[name]";
			text-size: 10;
			text-face-name: @oblique-fonts;
			text-fill: @water-text;
			text-halo-radius: @water-halo-radius;
			text-halo-fill: @water-halo-fill;
			text-spacing: 250;
			text-placement: line;
			text-repeat-distance: @waterway-text-repeat-distance;
			text-dy: 1;
			[zoom >= 12] { text-size: 11; }
			[zoom >= 14] { text-size: 13; }

		}
	}

	[feature = 'river']
  	,[feature = 'canal']{
		[zoom >= 10]{
			text-name: "[name]";
			text-size: 10;
			text-face-name: @oblique-fonts;
			text-fill: @water-text;
			text-halo-radius: @water-halo-radius;
			text-halo-fill: @water-halo-fill;
			text-spacing: 250;
			text-placement: line;
			text-repeat-distance: @waterway-text-repeat-distance;
			text-dy: 2;
			[zoom >= 12] { text-size: 12; }
			[zoom >= 14] { text-size: 14; }
		}
	}
}