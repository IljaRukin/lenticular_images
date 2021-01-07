# lenticular_images

calibrate and print lenticular images by example

To create a lenticular image you first have to determine some parameters of your printer. \
I'm using a Epson WF-2510 wich can print more or less reliably at 720dpi (dots per inch) and a lenticular sheet with 75lpi (lines per inch). (If I would do it again I would surely chose a sheet with a coarser spacing like 40lpi.) \
Therefore there are 9.6 pixels underneath each lens, wich are displayed varying on your observation angle. \
Since depending on the software you're using the image get's scaled we need to determine the actual pixels per lens to generate an image. To do so the script "calibrate.m" creates black lines with varying spacings. In our example there are "dpl = 9.6;" (dots per lens) and we vary this value by "d_dpl = 0.1;" in "n=21;" steps. Then we print the pattern and a rotated version, since inkjet printers usually have a preferred direction in wich the resolution is higher. I can recommend the program Irfanview for viewing and printing the image. After aligning the lens we chose the spacing at wich all lines disappear and become visible againg when moving the lens sheet.
This pixel spacing is then used to generate the actual animated lenticular image with the script "lenticular_image.m". \
Have fun.

here is a short demonstration: \
[<img src="https://img.youtube.com/vi/ul23OZaDYW0/maxresdefault.jpg" width="20%">](https://youtu.be/ul23OZaDYW0)
