from PIL import Image
import os

# Load the COE file
coe_file = "C:\\Users\\sks96\\Vivado Projects\\ImageProcessing_2\\ImageProcessing_2.sim\\sim_1\\behav\\xsim\\inversion.coe"
# Make an array or tuple to store RGB value for eah pixel
pixel_array = []
# Read the file
file = open(coe_file,'r')
# Read file lines
fileline = file.readlines()
# Get width and height from the file
width = 500
height = 400

# From each line get r,g,b binary values and store them in tuple as integer
for line in fileline[2:]:
    rgbTuple = (int(line[0:8], 2), int(line[8:16], 2), int(line[16:24], 2))
    pixel_array.append(rgbTuple)
# Reverse the array bcz pop happens from last index
pixel_array.reverse()
# Create empty image file
newImage = Image.new('RGB', (width, height))

for h in range(height):
    for w in range(width):  # pop pixel and place it at specific location
        newImage.putpixel((w, h), pixel_array.pop())
        if w == width - 1 and h == height - 1:
            break

(f_name, f_ext) = os.path.splitext(coe_file)
# Save the file
newImage.save(f_name + '_new.jpg')
print("DONE!")