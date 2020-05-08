@casing: #000000;
@road-lz: #f55;
@motorway: #CC4C02;
@trunk: #FE9929;
@primary: #FED98E;
@secondary: #FFFFD4;
@tertiary: #FFF;
@road: #FFF;
@track: #970202;
@footway: #970202;

#highways-lowzoom {
  [zoom <= 5] {
    [feature = 'motorway'],[feature = 'trunk'] {
      line-color: @road-lz;
      line-width: 0.5;
    }
  }

  [zoom >= 6] {
    [zoom = 6]{
      [feature = 'primary']{
        line-color: @road-lz;
        line-width: 0.5;
      }
    }
    ::casing {
      [feature = 'motorway'],[feature = 'trunk']{
        [zoom > 5]{
          line-width: 1.5;
          line-color: @casing;
          line-cap: butt;
          line-join: round;
          line-clip: false;
        }
      }
      [feature = 'primary'][zoom = 7] {
        line-color: @casing;
        line-width: 1.5;
        line-cap: butt;
        line-join: round;
        line-clip: false;
      }
    }
    ::fill{
      [feature = 'motorway'],[feature = 'trunk'] {
        [zoom > 5] {
          line-width: 1.2;
          line-cap: butt;
          line-join: round;
          line-clip: false;
        }
      }

      [feature = 'motorway'] {line-color: @motorway;}
      [feature = 'trunk'] {line-color: @trunk;}

      [feature = 'primary'][zoom = 7]{
        line-width: 1.2;
        line-color: @primary;
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
        line/line-color: @footway;
        line/line-dasharray: 2,3;
        line/line-width: 1;
      }
    }
  }
}
