@casing: #000000;
@motorway: #CC4C02;
@trunk: #FE9929;
@primary: #FED98E;
@secondary: #FFFFD4;
@tertiary: #FFF;
@road: #FFF;
@track: #970202;
@footway: #970202;

#highways-lowzoom {
  ::casing {
    [feature = 'motorway'],[feature = 'trunk'] {
      line-color: @casing;
      [zoom <= 5] {line-width: 1;}
      [zoom > 5][zoom <= 8] {line-width: 2;}
    }

    [feature = 'primary'][zoom >= 6] {
      line-color: @casing;
      line-width: 2;
    }
  }

  [feature = 'motorway'],[feature = 'trunk'] {
    [zoom <= 5] {line-width: 0.7;}
    [zoom > 5][zoom <= 8] {line-width: 1.5;}
  }

  [feature = 'motorway'] {line-color: @motorway;}
  [feature = 'trunk'] {line-color: @trunk;}

  [feature = 'primary'][zoom >= 6][zoom <= 8]{
    line-width: 1.5;
    line-color: @primary;
  }
}

#highways {

  ::casing {
    [zoom >= 8]{
      [feature = 'motorway'],[feature = 'trunk']
      ,[feature = 'primary'],[feature = 'secondary'] {
        line-width: 2.6;
        line-color: @casing;
      }
    }
    [zoom >= 10]{
      [feature = 'motorway'],[feature = 'trunk']
      ,[feature = 'primary'],[feature = 'secondary'],[feature = 'tertiary'] {
        line-width: 3.5;
        line-color: @casing;
        [feature = 'tertiary'] {line-width: 3.0;}
      }
    }
    [zoom >= 12] {
      [feature = 'road'],[feature = 'unclassified'] {
        line-width: 2.6;
        line-color: @casing;
      }
      [feature = 'footway'],[feature = 'path']{
        line-width: 1.6;
        line-color: rgba(255, 255, 255, 0.4);
      }
    }
  }

  [feature = 'motorway'] {line-color: @motorway;}
  [feature = 'trunk'] {line-color: @trunk;}
  [feature = 'primary'] {line-color: @primary;}

  [zoom >= 8]{
    [feature = 'motorway'],[feature = 'trunk']
    ,[feature = 'primary'],[feature = 'secondary'] {
      line-width: 2;   
      [feature = 'secondary'] {line-color: @secondary;}
    }
  }

  [zoom >= 10]{
    [feature = 'motorway'],[feature = 'trunk']
    ,[feature = 'primary'],[feature = 'secondary'],[feature = 'tertiary'] {
      line-width: 2.5;
      [feature = 'tertiary'] {line-color: @tertiary;}
    }
  }
  [zoom >= 12] {
    [feature = 'road'],[feature = 'unclassified'] {
      line-width: 2;
      line-color: @road;
    }
    [feature = 'track'],[feature = 'cycleway'],[feature = 'bridleway']{
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
      line/line-color: @footway;
      line/line-dasharray: 2,3;
      line/line-width: 1;
    }

  }
}