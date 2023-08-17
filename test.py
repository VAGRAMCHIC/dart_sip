from typing import Callable, Dict, Optional, Union

def byte_to_bits(byte: bytes) -> str:
    nbyte = bin(ord(byte)).lstrip("-0b")
    nbyte = ("0" * (8 - len(nbyte))) + nbyte
    return nbyte


byt = bytes("A".encode("utf-8"))
print(byte_to_bits(byt))
print(bin(5))
print(ord(byt))