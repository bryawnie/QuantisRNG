from ctypes import *
from ctypes.util import find_library

try:
    libq = CDLL(find_library("Quantis"))  # get Quantis library

    # generate 64 bytes using TRNG
    buffer = create_string_buffer(b'\0' * 63)
    libq.QuantisRead(1, 0, buffer, 64)
    print('Read random bytes from TRNG Quantis hardware!')
    buffer_array = []
    for a in buffer:
        buffer_array.append(hex(ord(a)))

    # transform bytes to hexadecimal expression
    raw1 = ''
    for value in buffer_array:
        n = value[2:]
        if len(n) == 2:
            raw1 += n
        elif len(n) == 1:
            raw1 += '0' + n
except Exception as e:
    print('Error: ' + str(e))
    print('Random value using python library instead of TRNG')