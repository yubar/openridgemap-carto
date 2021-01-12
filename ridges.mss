@ridge-width-4: 1;
@ridge-width-3: 2;
@ridge-width-2: 3;
@ridge-width-1: 4;

@text-size-4: 10;
@text-size-3: 12;
@text-size-2: 14;
@text-size-1: 16;

@text-dy-4: 4;
@text-dy-3: 6;
@text-dy-2: 9;
@text-dy-1: 12;

#ridges[zoom >= 11][feature = 'ridge']{
    line-color: @landform-color;
    line-join: round;
    line-cap: round;
    line-width: 0;
    
    [zoom = 11]{
        [len >= 5]{ line-width: @ridge-width-4; }
        [len >= 10]{ line-width: @ridge-width-3; }
        [len >= 30]{ line-width: @ridge-width-2; }
        [len >= 50]{ line-width: @ridge-width-1; }
    }
    [zoom = 12]{
        [len >= 2]{ line-width: @ridge-width-4; }
        [len >= 5]{ line-width: @ridge-width-3; }
        [len >= 10]{ line-width: @ridge-width-2; }
        [len >= 30]{ line-width: @ridge-width-1; }
    }
    [zoom >= 13]{
        [len >= 0]{ line-width: @ridge-width-4; }
        [len >= 2]{ line-width: @ridge-width-3; }
        [len >= 5]{ line-width: @ridge-width-2; }
        [len >= 10]{ line-width: @ridge-width-1; }
    }
}


#ridge-names[zoom >= 9]{

    [zoom = 9][len >= 030],
    [zoom = 10][len >= 010],
    [zoom = 11][len >= 005],
    [zoom = 12][len >= 002],
    [zoom >= 13]{
        text-name: "[name]";
        text-size: 0;
        text-face-name: @oblique-fonts;
    text-fill: #ecb;
        text-halo-radius: 1;
    text-halo-fill: #111;/*@standard-halo-fill;*/
        text-spacing: 500;
        text-character-spacing: 10;
        text-placement: line;
        text-align: center;
        text-transform: uppercase;
        text-max-char-angle-delta: 90;
        text-label-position-tolerance: 100;
        text-allow-overlap: true;
        
        [zoom <= 10]{
            line-color: @landform-color;    
        }
        [zoom = 9]{
            text-spacing: 10000;
            [len >= 030]{
                text-size: @text-size-4;
                text-dy: @text-dy-4; 
                line-width: @ridge-width-4;
                
            }
            [len >= 100]{
                text-size: @text-size-3;
                text-dy: @text-dy-3;
                line-width: @ridge-width-3;
                
            }
        }
        [zoom = 10]{
            text-spacing: 5000;
            [len >= 010]{ 
                text-size: @text-size-4; 
                text-dy: @text-dy-4; 
                line-width: @ridge-width-4;
               
            }
            [len >= 050]{ 
                text-size: @text-size-3; 
                text-dy: @text-dy-3; 
                line-width: @ridge-width-3;
               
            }
            [len >= 100]{ 
                text-size: @text-size-2; 
                text-dy: @text-dy-2; 
                line-width: @ridge-width-2;
                
            }
        }
        [zoom = 11]{
            text-spacing: 1000;
            [len >= 05]{ text-size: @text-size-4; text-dy: @text-dy-4; }
            [len >= 10]{ text-size: @text-size-3; text-dy: @text-dy-3; }
            [len >= 30]{ text-size: @text-size-2; text-dy: @text-dy-2; }
            [len >= 50]{ text-size: @text-size-1; text-dy: @text-dy-1; }
        }
        [zoom = 12]{
            [len >= 02]{ text-size: @text-size-4; text-dy: @text-dy-4; }
            [len >= 05]{ text-size: @text-size-3; text-dy: @text-dy-3; }
            [len >= 10]{ text-size: @text-size-2; text-dy: @text-dy-2; }
            [len >= 30]{ text-size: @text-size-1; text-dy: @text-dy-1; } 
        }
        [zoom >= 13]{
            [len >= 00]{ text-size: @text-size-4; text-dy: @text-dy-4; }
            [len >= 02]{ text-size: @text-size-3; text-dy: @text-dy-3; }
            [len >= 05]{ text-size: @text-size-2; text-dy: @text-dy-2; }
            [len >= 10]{ text-size: @text-size-1; text-dy: @text-dy-1; }
        }
    }
}
