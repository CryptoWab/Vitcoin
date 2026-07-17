import hashlib
import time
import struct

def check_hash(header, bits):
    target = (bits & 0xffffff) << (8 * ((bits >> 24) - 3))
    h = hashlib.sha256(hashlib.sha256(header).digest()).digest()
    h_int = int.from_bytes(h, byteorder='little')
    if h_int < target:
        return h[::-1].hex()
    return None

# Dogecoin / Vitcoin mainnet parameters
timestamp = b"Vitcoin launch date 15 July 2026 - A new era begins"
nTime = int(time.time()) # Aaj ka current time
nBits = 0x1e0ffff0       # Starting difficulty

print("Vitcoin Genesis Mining Started... Please wait...")
nonce = 0
while True:
    # Mimic simple block header construction
    header = struct.pack("<I", nonce) + timestamp + struct.pack("<II", nTime, nBits)
    genesis_hash = check_hash(header, nBits)
    if genesis_hash:
        print("\n--- GENESIS BLOCK FOUND! ---")
        print(f"New nTime: {nTime}")
        print(f"New Nonce: {nonce}")
        print(f"Genesis Hash: 0x{genesis_hash}")
        break
    nonce += 1
    if nonce % 100000 == 0:
        print(f"Checking nonce: {nonce}...", end='\r')
