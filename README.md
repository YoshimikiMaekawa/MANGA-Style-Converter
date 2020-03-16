# MangaStyleConverter
This program converts your image files to MANGA style with processing.

現在，3992x3816までのサイズの画像に対応できています．対応サイズを大きくしたい場合は，tonesディレクトリに入っているトーン画像のサイズを大きくしてください．

Currently, this program can handle images up to 3992x3816. If you want to increase the supported size, increase the size of tone images in the tones directory.

## 使用方法 -- How to run
### 日本語
+ 11行目：`input_name`に元画像ファイルのパスを指定
+ 12行目：`output_name`に変換ファイル(白黒マンガスタイル画像)のパスを指定
+ 13行目：`output_color_name`に変換ファイル(カラーマンガスタイル画像)のパスを指定
+ 31行目：size関数に元画像ファイルのサイズを指定
+ 実行

### English
+ At line 11: Set the path of your original image files to `input_name`.
+ At line 12: Set the path of converted(black and white MANGA style) image files to `output_name`.
+ At line 13: Set the path of converted(color MANGA style) image files to `output_color_name`.
+ At line 31: Set the size, this is width and height, of your original files to size function.
+ Run

## デモ -- Demonstration
### 元画像 -- Original image
以下の二つの画像を変換します．Convert the following images.
+ cat.JPG
![cat.JPG](https://github.com/YoshimikiMaekawa/MangaStyleConverter/blob/master/originalImages/cat.JPG)
+ toyamaStation.JPG
![toyamaStation.JPG](https://github.com/YoshimikiMaekawa/MangaStyleConverter/blob/master/originalImages/toyamaStation.JPG)

### 結果：白黒マンガスタイル画像 -- Results: Black and white MANGA style
+ manga_cat.png
![manga_cat.png](https://github.com/YoshimikiMaekawa/MangaStyleConverter/blob/master/mangaStyleImages/manga_cat.png)
+ manga_color_cat.png
![manga_toyamaStation.png](https://github.com/YoshimikiMaekawa/MangaStyleConverter/blob/master/mangaStyleImages/manga_toyamaStation.png)

### 結果：カラーマンガスタイル画像 -- Results: Color MANGA style
+ manga_color_toyamaStation.png
![manga_color_cat.png](https://github.com/YoshimikiMaekawa/MangaStyleConverter/blob/master/colorMangaStyleImages/manga_color_cat.png)
+ manga_toyamaStation.png
![manga_color_toyamaStation.png](https://github.com/YoshimikiMaekawa/MangaStyleConverter/blob/master/colorMangaStyleImages/manga_color_toyamaStation.png)
