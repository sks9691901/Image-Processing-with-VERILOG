# Image-Processing-with-VERILOG

How to generate Block Memory Generator in VIVADO

![Screenshot (22)_LI](https://user-images.githubusercontent.com/76876019/119669559-c74ad580-be55-11eb-8e2b-ea0f49aa7e8f.jpg)
![Screenshot (24)_LI](https://user-images.githubusercontent.com/76876019/119669591-cca82000-be55-11eb-8234-962a23485b6d.jpg)
![Screenshot (25)_LI](https://user-images.githubusercontent.com/76876019/119669608-d03ba700-be55-11eb-976b-fe9c902ae1b3.jpg)
![Screenshot (26)_LI](https://user-images.githubusercontent.com/76876019/119669630-d3cf2e00-be55-11eb-9cf4-15ad65b3fb6e.jpg)
Rename if you want
![Screenshot (29)_LI](https://user-images.githubusercontent.com/76876019/119669648-d6ca1e80-be55-11eb-9b5c-fd5c1fd3793a.jpg)
Choose width 24 (8bits for red, 8bits for green, 8bits for blue). 
Choose depth slightly greater than total number of pixels present in your image (here 2,00,000 pixels)
![Screenshot (30)_LI](https://user-images.githubusercontent.com/76876019/119669660-d92c7880-be55-11eb-8c94-5b1713952f97.jpg)
Load COE file
![Screenshot (31)_LI](https://user-images.githubusercontent.com/76876019/119669684-dd589600-be55-11eb-98d8-79d78bbbc30b.jpg)


      [2:0]parameter      operation
          000             Brightness increase
          001             Brightness decrease
          010             Grayscale
          011             Red filter
          100             Green filter
          101             Blue filter
          110             Threshold
          111             Inversion

Original Picture

![original](https://user-images.githubusercontent.com/76876019/119666408-f90e6d00-be52-11eb-8095-72e9a2e69e95.jpg)

Brightness increase

![brightnessInc_new](https://user-images.githubusercontent.com/76876019/119666543-17746880-be53-11eb-9749-bec260ad3039.jpg)

Brightness decrease

![brightnessDec_new](https://user-images.githubusercontent.com/76876019/119666497-0c213d00-be53-11eb-8734-0bb0f5c1be6e.jpg)

Grayscale

![grayscale_new](https://user-images.githubusercontent.com/76876019/119666613-2824de80-be53-11eb-814f-ba4dd2fe8cfa.jpg)

Red filter

![redFilter_new](https://user-images.githubusercontent.com/76876019/119666656-307d1980-be53-11eb-9320-b64b34304f91.jpg)

Green filter

![greenFilter_new](https://user-images.githubusercontent.com/76876019/119666740-44288000-be53-11eb-9f7e-deebcc68a907.jpg)

Blue filter

![blueFilter_new](https://user-images.githubusercontent.com/76876019/119666698-38d55480-be53-11eb-8138-9c88451c60b6.jpg)

Threshold

![threshold_new](https://user-images.githubusercontent.com/76876019/119666794-50acd880-be53-11eb-9ed4-514862c6d5f4.jpg)

Inversion

![inversion_new](https://user-images.githubusercontent.com/76876019/119666847-5c000400-be53-11eb-8d3e-8826aa245bc2.jpg)


------------------------------------------------------------------------------------------------------------------------------------------------------------
