import serial
import time

addresses=[]
with open("Tracefile1.txt", "r") as f:
    lines = f.readlines()
    for line in lines:
        word = line.split()[1]
        addr = "0" * (8-len(word)) + word
        addresses.append(addr)

# Serial Object
ser = serial.Serial(port='COM15', baudrate=9600)

# Start Read instruction
print('00')
ser.write(bytearray.fromhex('00'))
time.sleep(1)
print('ff')
ser.write(bytearray.fromhex('ff'))
time.sleep(1)

# Read addresses
for addr in addresses:
    for i in range(0,8,2): # Splits 32 bit address into 4 byte-packets
        print(addr[i:i+2], end=' ')
        ser.write(bytearray.fromhex(addr[i:i+2])) # Sends as 1byte serial data
        time.sleep(1) # 1 second delay to sync with the FPGA slowed clock
    print()

# Stop Read instruction
print('fe')
ser.write(bytearray.fromhex('fe'))
time.sleep(1)
ser.write(bytearray.fromhex('00'))
ser.close()