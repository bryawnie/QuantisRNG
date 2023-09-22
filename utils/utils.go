package utils

/*
#cgo LDFLAGS: -lQuantis -lusb-1.0
#include "Quantis.h"
*/
import "C"
import "unsafe"

func ProxyRNG() []byte {

	var data [64]byte
	buffer := unsafe.Pointer(&data[0])
	C.QuantisRead(1, 0, buffer, 64)
	return data[:]
}
