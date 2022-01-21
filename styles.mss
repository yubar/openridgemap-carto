@standard-halo-radius: 1;
@standard-halo-fill: rgba(4,4,8,0.7);

@land-color: #f4f0ec;
@landform-color: #402010;
@landform-text: #c8bcaa;
@boundary-color-lz: #c700e6;
@boundary-color-mz: fadeout(@boundary-color-lz, 50%);
@boundary-color: fadeout(@boundary-color-lz, 80%);


@waterway-color: #004080;
@water-border-color: @waterway-color;
@water-color: lighten(@water-border-color, 50%);
@water-area: @waterway-color;
@water-text: lighten(@water-border-color, 50%);

@waterway-mz: #2367aa;
@water-color-mz: darken(@water-color, 15%);
@water-border-color-mz: @waterway-mz;
@water-text-mz: @water-text;

@waterway-lz: @water-color-lz;
@water-color-lz: darken(@water-color, 30%);
@water-border-color-lz: @waterway-lz;
@water-text-lz: darken(@waterway-lz, 20%);

@waterway-text-repeat-distance: 100;
@water-halo-radius: 0;
@water-halo-fill: rgba(0,0,0,0.7);

@glacier: rgba(0,187,255,0.1);
@glacier-lowzoom: rgba(0,187,255,0.2);
@glacier-line: #389cff;


@standard-font: @book-fonts;
@standard-font-size: 10;
@standard-wrap-width: 30;
@wide-wrap-width: 45;
@standard-line-spacing-size: -1.5;


Map {
	buffer-size: 256;
}
