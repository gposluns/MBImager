

file = open("half_black.bmp","rb")
image = file.read()
for i in image[10:14]:
    print i
    print ord(i)

print bin(ord(image[62]))
print ord(image[63])
file.close()
