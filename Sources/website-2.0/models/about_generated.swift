 // automatically generated by the FlatBuffers compiler, do not modify
 // swiftlint:disable all
 // swiftformat:disable all

 import FlatBuffers

 public struct About: FlatBufferObject, Verifiable {

   static func validateVersion() { FlatBuffersVersion_22_9_24() }
   public var __buffer: ByteBuffer! { return _accessor.bb }
   private var _accessor: Table

   public static func getRootAsAbout(bb: ByteBuffer) -> About { return About(Table(bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))) }

   private init(_ t: Table) { _accessor = t }
   public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

   private enum VTOFFSET: VOffset {
     case name = 4
     case description = 6
     var v: Int32 { Int32(self.rawValue) }
     var p: VOffset { self.rawValue }
   }

   public var name: String? { let o = _accessor.offset(VTOFFSET.name.v); return o == 0 ? nil : _accessor.string(at: o) }
   public var nameSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.name.v) }
   public var description: String? { let o = _accessor.offset(VTOFFSET.description.v); return o == 0 ? nil : _accessor.string(at: o) }
   public var descriptionSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.description.v) }
   public static func startAbout(_ fbb: inout FlatBufferBuilder) -> UOffset { fbb.startTable(with: 2) }
   public static func add(name: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: name, at: VTOFFSET.name.p) }
   public static func add(description: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: description, at: VTOFFSET.description.p) }
   public static func endAbout(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset { let end = Offset(offset: fbb.endTable(at: start)); return end }
   public static func createAbout(
     _ fbb: inout FlatBufferBuilder,
     nameOffset name: Offset = Offset(),
     descriptionOffset description: Offset = Offset()
   ) -> Offset {
     let __start = About.startAbout(&fbb)
     About.add(name: name, &fbb)
     About.add(description: description, &fbb)
     return About.endAbout(&fbb, start: __start)
   }

   public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws where T: Verifiable {
     var _v = try verifier.visitTable(at: position)
     try _v.visit(field: VTOFFSET.name.p, fieldName: "name", required: false, type: ForwardOffset<String>.self)
     try _v.visit(field: VTOFFSET.description.p, fieldName: "description", required: false, type: ForwardOffset<String>.self)
     _v.finish()
   }
 }

