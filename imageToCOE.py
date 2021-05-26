from PIL import Image
import os

# Load any image file
file = "C:\\Users\\VivadoProjects\\original.png" # path of your original image
image = Image.open(file)

# Get the pixel format of the image using 'mode' attribute
# Here RGB is preferred
if image.mode != 'RGB':  # If not RGB then convert to RGB
    image = image.convert(mode="RGB")
# Get the file name and file extension
(f_name, f_ext) = os.path.splitext(file)
# Create a new COE file
coe_file = open(f_name + '.coe', 'w')

coe_file.write("Memory_initialization_radix=2;\nMemory_initialization_vector=\n")

# get size of the image using 'size'  attribute
(width, height) = image.size

for h in range(height):
    for w in range(width):
        r, g, b = image.getpixel((w, h))  # Get the pixel value of given position
        Rb = bin(r)[2:].zfill(8)  # 0b01101101 => 01101101
        Gb = bin(g)[2:].zfill(8)
        Bb = bin(b)[2:].zfill(8)
        coe_file.write(Rb + Gb + Bb)  # Rb,Gb,Bb are strings
        if w == width - 1 and h == height - 1:
            coe_file.write(";")
        else:
            coe_file.write(",\n")

coe_file.close()  # Close the file
print("DONE!")
