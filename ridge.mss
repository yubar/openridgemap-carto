@water-color: #aad3df;
@water-border-color: #0066cc;
@land-color: #f2efe9;

@standard-halo-radius: 2;
@standard-halo-fill: rgba(255,255,255,0.5);

@landform-color: darken(#b46e31, 10%);
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

#mountain-ridges[zoom >= 9][feature = 'natural_ridge']{
	::fill {
		line/line-color: @landform-color;
    line/line-join: round;
    line/line-cap: round;
    line/line-width: 0;
    [zoom >= 9]{
    	[len >= 100]{line/line-width: @ridge-width-3;}
    }
    [zoom >= 10]{
        [len >= 30]{line/line-width: @ridge-width-4;}
        [len >= 50]{line/line-width: @ridge-width-3;}
        [len >= 100]{line/line-width: @ridge-width-2;}
    }
    [zoom >= 11]{
    	[len >= 5]{line/line-width: @ridge-width-4;}
    	[len >= 10]{line/line-width: @ridge-width-3;}
    	[len >= 30]{line/line-width: @ridge-width-2;}
        [len >= 50]{line/line-width: @ridge-width-1;}
    }
    [zoom >= 12]{
        [len >= 2]{line/line-width: @ridge-width-4;}
        [len >= 5]{line/line-width: @ridge-width-3;}
        [len >= 10]{line/line-width: @ridge-width-2;}
        [len >= 30]{line/line-width: @ridge-width-1;}
    }
    [zoom >= 13]{
    	[len >= 0]{line/line-width: @ridge-width-4;}
    	[len >= 2]{line/line-width: @ridge-width-3;}
    	[len >= 5]{line/line-width: @ridge-width-2;}
        [len >= 10]{line/line-width: @ridge-width-1;}
    }

    text-name: "[name]";
    text-size: 14;
    text-face-name: @oblique-fonts;
    text-fill: #000;
    text-halo-radius: 0;
    text-halo-fill: #000;
    text-spacing: 50;
    text-character-spacing: 10;
    text-placement: line;
    text-repeat-distance: 100;
    text-dy: 2;
    text-transform: uppercase;
    text-allow-overlap: true;
  }
}
