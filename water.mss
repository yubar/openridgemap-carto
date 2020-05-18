@waterway-width-4: 0.5;
@waterway-width-3: 1.0;
@waterway-width-2: 1.5;
@waterway-width-1: 2.0;


#waterways-gen{
  ::fill{
	[zoom < 5][len >= 1000]{
	    line-color: @waterway-lz;
		line-width: 0.5;
		line-cap: butt;
		line-join: round;
		line-clip: false;
		[len >= 2500]{ line-width: 1; }
	}
	[zoom = 5][len >= 500] {
		line-color: @waterway-lz;
		line-width: 0.5;
		line-cap: butt;
		line-join: round;
		line-clip: false;
		[len > 1000]{ line-width: 1; }
		[len > 2500]{ line-width: 1.5; }
	}
	[zoom > 5][len >= 250]{
	    line-color: @waterway-lz;
		line-width: 0.5;
		line-cap: butt;
		line-join: round;
		line-clip: false;
		[len >= 500]{ line-width: 1; }
		[len >= 1000]{ line-width: 1.5; }
	}
  }

  ::label{
  	[zoom > 2][zoom <= 5][len >= 2500],
  	[zoom = 5][len >= 1000],
  	[zoom = 6][len >= 500],
  	[zoom = 7][len >= 250]{
	  	text-name: "[name]";
		text-size: 10;
		text-face-name: @oblique-fonts;
		text-fill: @water-text-lz;
		text-halo-radius: 1.5;
		text-halo-fill: rgba(255,255,255,0.5);
		text-spacing: 250;
		text-placement: line;
		text-repeat-distance: 150;
		text-dy: 2;
		text-max-char-angle-delta: 40;
		text-simplify: 50;
		text-smooth: 1;
		[zoom = 3]{
  			text-size: 8; 
  			text-simplify: 500;
			text-smooth: 1;
  		}
		[zoom = 7][len < 500]{
  			text-size: 9; 
  			text-simplify: 10;
  			text-max-char-angle-delta: 30;
  		}
	}
  }
}

#waterways {

  [feature = 'river']
  ,[feature = 'canal']{
  	[zoom >= 8]{

		line-width: 0; 
	    line-color: @waterway-color;
		line-cap: butt;
		line-join: round;
		line-clip: false;

		[intermittent = 1] {
		    line-dasharray: 8,4; 
		}
		
	    [zoom < 11] {line-color: @water-border-color-mz}

	    [zoom = 8]{
	    	[len >= 30]{ line-width: @waterway-width-4; }
	    	[len >= 50]{ line-width: @waterway-width-3; }
	    }
	    [zoom = 9]{
	    	[len >= 10]{ line-width: @waterway-width-4; }
	    	[len >= 30]{ line-width: @waterway-width-3; }
	    	[len >= 50]{ line-width: @waterway-width-2; }

	    }
	    [zoom = 10]{
	        [len >= 5]{ line-width: @waterway-width-4; }
	        [len >= 10]{ line-width: @waterway-width-3; }
	        [len >= 30]{ line-width: @waterway-width-2; }
	        [len >= 50]{ line-width: @waterway-width-1; }
	    }
	    [zoom = 11]{
	        [len >= 2]{ line-width: @waterway-width-4; }
	        [len >= 5]{ line-width: @waterway-width-3; }
	        [len >= 10]{ line-width: @waterway-width-2; }
	        [len >= 30]{ line-width: @waterway-width-1; }
	    }
	    [zoom >= 12]{
	        [len >= 0]{ line-width: @waterway-width-4; }
	        [len >= 2]{ line-width: @waterway-width-3; }
	        [len >= 5]{ line-width: @waterway-width-2; }
	        [len >= 10]{ line-width: @waterway-width-1; }
	    }

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
		[zoom >= 15] {line-width: 2.5;}

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
    [zoom >= 0][zoom < 1][areapx >= 1],
    [zoom >= 1][zoom < 2][areapx >= 4],
    [zoom >= 2][zoom < 8][areapx >= 8],
    [zoom >= 8][zoom < 14][areapx >= 16],
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
        	polygon-fill: @water-color-lz;
	        [zoom = 8]{
	        	polygon-fill: @water-color-mz;
	        }
	        [zoom >= 9]{
	        	polygon-fill: @water-color;
	        	line-width: 0.5;
	        	line-color: @water-border-color-mz;
	        }
	        [zoom >= 11]{
	          line-color: @water-border-color;
	          line-width: 1;
	        }
    	
      	}
      	[feature != 'glacier'][intermittent = 1] {
	        polygon-pattern-file: url('symbols/intermittent_water.png');
    	}
    }


    [zoom >= 5][areapx >= 1000] {
		text-name: "[name]";
		text-size: 10;
		text-fill: @water-text;
		[zoom <=11]{ text-fill: @water-text-mz; }
		text-face-name: @oblique-fonts;
		text-halo-radius: @water-halo-radius;
		text-halo-fill: @water-halo-fill;
		text-placement: interior;
		text-wrap-width: 50;
    }
}

#waterways::text {

	[feature = 'river']
  	,[feature = 'canal']{
		[zoom >= 8]{
			text-name: "[name]";
			text-size: 8;
			text-face-name: @oblique-fonts;
			text-fill: @water-text;
			text-halo-radius: @water-halo-radius;
			text-halo-fill: @water-halo-fill;
			text-spacing: 250;
			text-placement: line;
			text-repeat-distance: @waterway-text-repeat-distance;
			text-dy: 2;
			[zoom = 10] { text-fill: @water-text-mz; }
			[zoom = 8][len >=50],
			[zoom = 9][len >=30],
			[zoom >= 10]{ 
				text-size: 10; 
			}
			[zoom >= 12] { text-size: 12; }
			[zoom >= 14] { text-size: 14; }
		}
	}

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

	
}