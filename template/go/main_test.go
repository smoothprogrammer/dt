package main

import (
	"testing"

	"github.com/minizilla/testr"
)

func TestGreet(t *testing.T) {
	is := testr.New(t)
	is.Equal(greet(), "Hello, World!")
}
