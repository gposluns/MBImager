import struct

file = open("half_black.bmp","rb")
image = bytearray(file.read())
file.close()

#print struct.unpack_from('<L',image, 10)
print struct.unpack_from('<L', image, 10)[0]
print "image property: ", len(image), type(image)
for i in range(62,66):
    print i, bin(image[i]), image[i], struct.unpack_from('<H', image, i)


#get start index of the pixel array
pix_start_pos = struct.unpack_from('<L', image, 10)[0]

#get the width
pat_width = struct.unpack_from('<L', image, 18)[0]

#get the height
pat_height = struct.unpack_from('<L', image, 22)[0]

print pix_start_pos, pat_width, pat_height
counter = 0

#generate the pattern
pattern = bytearray();
for i in range(pix_start_pos, pix_start_pos+pat_height*pat_width/4):
    if (image[i] != 0):
        pattern.append(image[i])

        
print len(pattern)
