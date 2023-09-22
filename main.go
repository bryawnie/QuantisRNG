package main

import (
	"encoding/hex"
	"fmt"

	"github.com/bryawnie/RNGscript/utils"
)

func main() {
	data := utils.ProxyRNG()
	value := hex.EncodeToString(data[:])
	fmt.Printf("RNG Value: %s", value)
}
