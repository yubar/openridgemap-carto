@standard-halo-radius: 2;
@standard-halo-fill: rgba(255,255,255,0.5);

@land-color: #f4f0ec;
@landform-color: #9c4400;
@boundary-color-lz: #c700e6;
@boundary-color-mz: fadeout(@boundary-color-lz, 50%);
@boundary-color: fadeout(@boundary-color-lz, 80%);


@water-color: #5ec6ff;
@waterway-color: #0060bf;
@water-border-color: @waterway-color;
@water-text: @water-border-color;

@waterway-mz: #2367aa;
@water-color-mz: darken(@water-color, 15%);
@water-border-color-mz: @waterway-mz;
@water-text-mz: darken(@waterway-mz, 20%);

@waterway-lz: @water-color-lz;
@water-color-lz: darken(@water-color, 30%);
@water-border-color-lz: @waterway-lz;
@water-text-lz: darken(@waterway-lz, 20%);

@waterway-text-repeat-distance: 100;
@water-halo-radius: @standard-halo-radius/2;
@water-halo-fill: @standard-halo-fill;

@glacier: rgba(0,187,255,0.1);
@glacier-lowzoom: rgba(0,187,255,0.2);
@glacier-line: #389cff;


@standard-font: @book-fonts;
@standard-font-size: 10;
@standard-wrap-width: 30;
@wide-wrap-width: 45;
@standard-line-spacing-size: -1.5;

@ridge-halo-radius: @standard-halo-radius;

Map {
	buffer-size: 256;
}
