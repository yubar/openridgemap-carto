@casing: #000000;
@road-lz: #f55;
@road-mz: #CC4C02;
@motorway: #ce4d04;
@trunk: #d77900;
@primary: #d6a335;
@secondary: #FFFFD4;
@tertiary: #FFF;
@road: #FFF;
@track: #970202;
@footway: #970202;
@railway-lz: #333;

#highways-lowzoom {
  [zoom <= 5] {
    [feature = 'motorway'],[feature = 'trunk'] {
      line-color: @road-mz;
      line-width: 0.6;
    }
  }
  [zoom = 6]{
    [feature = 'motorway'],[feature = 'trunk']{
      line-color: @road-mz;
      line-width: 0.8;
    }
    [feature = 'primary']{
      line-color: @road-mz;
      line-width: 0.5; 
    }
  }

  [zoom = 7] {
    /*
    ::casing {
      [feature = 'motorway'], [feature = 'trunk'], [feature = 'primary']{
        line-color: @casing;
        line-width: 1.5;
        line-cap: butt;
        line-join: round;
        line-clip: false;
      }
    }
    */
    ::fill{
      [feature = 'motorway'] { line-color: @motorway; }
      [feature = 'trunk'] { line-color: @trunk; }
      [feature = 'primary'] { line-color: @primary; }

      [feature = 'motorway'],[feature = 'trunk'], [feature = 'primary'] {
          line-width: 1.3;
          line-cap: butt;
          line-join: round;
          line-clip: false;
      }
    }
  }
}

#highways {

  ::casing {
    [zoom >= 8]{
      [feature = 'motorway'],[feature = 'trunk']
      ,[feature = 'primary'],[feature = 'secondary'] {
        line-width: 2.6;
        line-color: @casing;
        line-cap: butt;
        line-join: round;
      }
    }
    [zoom >= 10]{
      [feature = 'motorway'],[feature = 'trunk']
      ,[feature = 'primary'],[feature = 'secondary'],[feature = 'tertiary'] {
        line-width: 3.5;
        [feature = 'tertiary'] {line-width: 3.0;}
      }
    }
    [zoom >= 12] {
      [feature = 'road'],[feature = 'unclassified'] {
        line-width: 2.6;
      }
      [feature = 'footway'],[feature = 'path']{
        line-width: 1.6;
        line-color: rgba(255, 255, 255, 0.4);
      }
    }
  }
  ::fill{

    line-width: 0;  
    

    [feature = 'motorway'] {line-color: @motorway;}
    [feature = 'trunk'] {line-color: @trunk;}
    [feature = 'primary'] {line-color: @primary;}

    [zoom >= 8]{
      [feature = 'motorway'],[feature = 'trunk']
      ,[feature = 'primary'],[feature = 'secondary'] {
        line-cap: butt;
        line-join: round;  
        line-width: 2;
        [feature = 'secondary'] {line-color: @secondary;}
      }
    }

    [zoom >= 10]{
      [feature = 'motorway'],[feature = 'trunk']
      ,[feature = 'primary'],[feature = 'secondary'],[feature = 'tertiary'] {
        line-cap: butt;
        line-join: round; 
        line-width: 2.5;
        [feature = 'tertiary'] {line-color: @tertiary;}
      }
    }
    [zoom >= 12] {
      [feature = 'road'],[feature = 'unclassified'] {
        line-cap: butt;
        line-join: round; 
        line-width: 2;
        line-color: @road;
      }
      [feature = 'track'],[feature = 'cycleway'],[feature = 'bridleway']{
        line-cap: butt;
        line-join: round; 
        line-color: @track;
        line-opacity: 0.8;
        line-width: 1.5;

        [feature = 'cycleway'],[feature = 'bridleway'] { 
          line-width: 1.2;
          line-dasharray: 6,3,2,3;
        }
        
        [tracktype = 'grade1'] {
          line-dasharray: 100,0;
        }
        [tracktype = 'grade2'] {
          line-dasharray: 10,2;
        }
        [tracktype = 'grade3'] {
          line-dasharray: 8,4;
        }
        [tracktype = 'grade4'] {
          line-dasharray: 6,3;
        }
        [tracktype = 'grade5'] {
          line-dasharray: 3,2;
        }
      }

      [feature = 'footway'],[feature = 'path']{
        line-cap: butt;
        line-join: round; 
        line-color: @footway;
        line-dasharray: 2,3;
        line-width: 1;
      }
    }
  }
}


#railways{
  [zoom <= 9]{
    [feature="rail"][usage="main"],
    [feature="rail"][usage="branch"][zoom >= 6]{
      line-cap: butt;
      line-join: round; 
      line-color: @railway-lz;
      line-width: 0.6;
      [zoom >= 7][usage="main"]{ line-width: 1; }
    }
  }
  [zoom > 9]{
    [feature="rail"]{
        line-cap: butt;
        line-join: round; 
        casing/line-color: @railway-lz;
        fill/line-color: #fff;

        [usage="main"] { 
          casing/line-width: 1.8; 
          fill/line-width: 1.5; 
          fill/line-dasharray: 10,10;
        }
        [usage!="main"] { 
          casing/line-width: 1.4;
          fill/line-width: 1.2;
          fill/line-dasharray: 8,8;
        }

        [zoom = 11]{
          [usage="main"] { 
            casing/line-width: 2.4; 
            fill/line-width: 2.0; 
            fill/line-dasharray: 12,12;
          }
          [usage!="main"] { 
            casing/line-width: 1.8;
            fill/line-width: 1.5;
            fill/line-dasharray: 10,10;
          }
        }

        [zoom = 12]{
          [usage="main"] { 
            casing/line-width: 2.6; 
            fill/line-width: 2.2; 
            fill/line-dasharray: 14,14;
          }
          [usage!="main"] { 
            casing/line-width: 2.0;
            fill/line-width: 1.7;
            fill/line-dasharray: 12,12;
          }
        }

        [zoom >= 13]{
          [usage="main"] { 
            casing/line-width: 3.0; 
            fill/line-width: 2.5; 
            fill/line-dasharray: 18,18;
          }
          [usage!="main"] { 
            casing/line-width: 2.4;
            fill/line-width: 2.0;
            fill/line-dasharray: 15,15;
          }
        }
    }
  }
}