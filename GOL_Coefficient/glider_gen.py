width = 96
height = 64
pixels = [0] * (width * height)

# Glider coordinates (x, y)
glider_cells = [(2,1), (3,2), (1,3), (2,3), (3,3)]

for x, y in glider_cells:
    address = (y * width) + x
    pixels[address] = 1

with open("glider.coe", "w") as f:
    f.write("memory_initialization_radix=2;\n")
    f.write("memory_initialization_vector=\n")
    
    # Write the 6144 bits
    for i in range(len(pixels)):
        if i == len(pixels) - 1:
            f.write(f"{pixels[i]};\n") # Last item ends with semicolon
        else:
            f.write(f"{pixels[i]},\n")