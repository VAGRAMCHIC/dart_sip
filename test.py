from typing import Callable, Dict, Optional, Union

def byte_to_bits(byte: bytes) -> str:
    nbyte = bin(ord(byte)).lstrip("-0b")
    print(nbyte)
    nbyte = ("0" * (8 - len(nbyte))) + nbyte
    print(type(nbyte))
    return nbyte


byt = bytes("a".encode("utf-8"))
print(byte_to_bits(byt))