import FlatBuffers

print("Hello, world!")

var builder = FlatBufferBuilder()
let off = builder.create(string: "welcome")
print("off: \(off.o)")
