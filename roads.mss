@casing: #000000;
@motorway: #CC4C02;
@trunk: #FE9929;
@primary: #FED98E;
@secondary: #FFFFD4;
@tertiary: #FFF;
@road: #FFF;
@track: #1c1914;
@footway: #4c4944;



#highways-lowzoom-casing {

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

#highways-lowzoom {

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


#highways-casing{
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
      line-width: 3.9;
      line-color: @casing;
    }
  }
  [zoom >= 12] {
    [feature = 'road'],[feature = 'unclassified'] {
      line-width: 2.6;
      line-color: @casing;
    }
  }
}

#highways {

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
      line-width: 3;
      [feature = 'tertiary'] {line-color: @tertiary;}
    }
  }
  [zoom >= 12] {
    [feature = 'road'],[feature = 'unclassified'] {
      line-width: 2;
      line-color: @road;
    }
    [feature = 'track'] {
      line-color: @track;
      line-opacity: 0.8;
      line-width: 1.5;
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
  }
}


/*
#highways {
  [feature = 'unclassified'] {
    [zoom >= 12] {
      line/line-color: @track-fill;
      
      line/line-cap: round;
      line/line-join: round;
      line/line-clip:false;

      line/line-width: @unclassified-width;
    }
  }

  [feature = 'track'] {
    [zoom >= 12] {
      line/line-color: @track-fill;
      
      line/line-cap: round;
      line/line-join: round;
      line/line-opacity: 0.8;
      line/line-clip:false;

      line/line-width: @track-width;

      [tracktype = 'grade1'] {
        line/line-dasharray: 100,0;
      }
      [tracktype = 'grade2'] {
        line/line-dasharray: 8.8,3.2;
      }
      [tracktype = 'grade3'] {
        line/line-dasharray: 5.6,4.0;
      }
      [tracktype = 'grade4'] {
        line/line-dasharray: 3.2,4.8;
      }
      [tracktype = 'grade5'] {
        line/line-dasharray: 1.6,6.4;
      }
    }
  }

  [feature = 'unclassified'] {
    [zoom >= 12] {
      line/line-color: @unclassified-fill;
      
      line/line-cap: round;
      line/line-join: round;
      line/line-clip:false;

      line/line-width: @unclassified-width*0.6;
    }
  }

  [feature = 'footway'],[feature = 'path']{
    [zoom >= 12] {
      line/line-color: @footway-fill;
      line/line-dasharray: 1,3;
      line/line-join: round;
      line/line-cap: round;
      line/line-width: @footway-width;
    }
  }
}
*/