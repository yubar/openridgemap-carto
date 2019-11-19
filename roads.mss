
@track-fill: #1c1914;
@track-width: 1.5;
@unclassified-fill: #ffffff;
@unclassified-casing: #000000;
@unclassified-width: 3;
@footway-fill: #4c4944;
@footway-width: 1;

#roads-casing {
  [feature = 'highway_unclassified'] {
    [zoom >= 12] {
      line/line-color: @track-fill;
      
      line/line-cap: round;
      line/line-join: round;
      line/line-clip:false;

      line/line-width: @unclassified-width;
    }
  }
}
#roads-fill {
  [feature = 'highway_track'] {
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

  [feature = 'highway_unclassified'] {
    [zoom >= 12] {
      line/line-color: @unclassified-fill;
      
      line/line-cap: round;
      line/line-join: round;
      line/line-clip:false;

      line/line-width: @unclassified-width*0.6;
    }
  }

  [feature = 'highway_footway'],[feature = 'highway_path']{
    [zoom >= 12] {
      line/line-color: @footway-fill;
      line/line-dasharray: 1,3;
      line/line-join: round;
      line/line-cap: round;
      line/line-width: @footway-width;
    }
  }
}