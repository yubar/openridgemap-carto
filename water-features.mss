@breakwater-color: #aaa; /* Also for groyne */
@dam: #adadad;
@dam-line: #444444;
@weir-line: #aaa;
@lock-gate: #aaa;
@lock-gate-line: #aaa;

#water-barriers-point, #water-barriers-line, #water-barriers-poly {
  [waterway = 'dam'] {
    #water-barriers-poly[zoom >= 13] {
      line-width: 2;
      line-color: @dam-line;
      line-join: round;
      line-cap: round;
      polygon-fill: @dam;
    }
    #water-barriers-line[zoom >= 13] {
      line-width: 2;
      line-color: @dam-line;
      line-join: round;
      line-cap: round;
    }
    #water-barriers-point[zoom >= 17] {
      marker-fill: @dam;
      marker-line-color: @dam-line;
      marker-line-width: 1;
      marker-width: 8;
      [zoom >= 18] { marker-width: 10; }
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
  }

  [waterway = 'weir'] {
    #water-barriers-line[zoom >= 13] {
      line-color: @weir-line;
      line-width: 2;
      line-dasharray: 2,2;
    }
    #water-barriers-point[zoom >= 17] {
      marker-fill: @water-border-color;
      marker-line-color: @weir-line;
      marker-line-width: 1;
      marker-width: 8;
      [zoom >= 18] { marker-width: 10; }
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
  }

  [waterway = 'lock_gate'] {
    #water-barriers-line[zoom >= 13] {
      line-color: @lock-gate-line;
      line-width: 2;
    }
    #water-barriers-point[zoom >= 17] {
      marker-fill: @lock-gate;
      marker-line-width: 0;
      marker-width: 8;
      [zoom >= 18] { marker-width: 10; }
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
  }
}

#springs {
  [natural = 'spring'][zoom >= 14] {
    marker-file: url('symbols/spring.svg');
    marker-placement: interior;
    marker-clip: false;
  }
}
