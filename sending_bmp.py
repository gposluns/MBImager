import struct


def bytearray_to_bitarray(data, num):
    base = int(num/8)
    shift = num % 8
    return (data[base] & (0x80>>shift)) >> (7-shift)


file = open("1pat_zebra.bmp","rb")
image = bytearray(file.read())
file.close()

'''
#print struct.unpack_from('<L',image, 10)
print struct.unpack_from('<L', image, 10)[0]
print "image property: ", len(image), type(image)
for i in range(62,66):
    print i, bin(image[i]), image[i], struct.unpack_from('<H', image, i)
'''

num_channel = 16
channel_width = 18


#start index of the pixel array
pix_start_pos = struct.unpack_from('<L', image, 10)[0]
#pattern width in pixels
pat_width = struct.unpack_from('<L', image, 18)[0]
#pattern height in pixels
pat_height = struct.unpack_from('<L', image, 22)[0]

print pix_start_pos, pat_width, pat_height

'''
for i in range (pat_width*pat_height/8):
    print bin(image[pix_start_pos+i]^0xff),
    if ((i+1)%(4) == 0):
        print ""
print ""
'''

image = image[pix_start_pos: pix_start_pos+pat_width*pat_height]    
image = [bytearray_to_bitarray(image,i) for i in range(pat_width*pat_height)]

print "image length", len(image)
#print image

#generate the pattern
pattern = bytearray()
for y in range(pat_height):
    for x in range(channel_width):
        one_byte = 0
        for i in range (num_channel):
            one_byte += image[y*pat_width + x + channel_width * i] <<(7-(i%8))
            #print image[y*pat_width + x + channel_width * i],
            #print one_byte, 
            if ((i+1)%8 == 0):
                #print bin(one_byte^ 0xff),
                pattern.append(one_byte ^ 0xff) #make 0 = white, 1 = black
                one_byte = 0
    


        
