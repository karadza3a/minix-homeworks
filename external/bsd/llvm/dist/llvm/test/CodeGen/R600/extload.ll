; RUN: llc -march=r600 -mcpu=cypress < %s | FileCheck -check-prefix=EG %s

; EG-LABEL: @anyext_load_i8:
; EG: AND_INT
; EG-NEXT: 255
define void @anyext_load_i8(i8 addrspace(1)* nocapture noalias %out, i8 addrspace(1)* nocapture noalias %src) nounwind {
  %cast = bitcast i8 addrspace(1)* %src to i32 addrspace(1)*
  %load = load i32 addrspace(1)* %cast, align 1
  %x = bitcast i32 %load to <4 x i8>
  %castOut = bitcast i8 addrspace(1)* %out to <4 x i8> addrspace(1)*
  store <4 x i8> %x, <4 x i8> addrspace(1)* %castOut, align 1
  ret void
}

; EG-LABEL: @anyext_load_i16:
; EG: AND_INT
; EG: LSHL
; EG: 65535
define void @anyext_load_i16(i16 addrspace(1)* nocapture noalias %out, i16 addrspace(1)* nocapture noalias %src) nounwind {
  %cast = bitcast i16 addrspace(1)* %src to i32 addrspace(1)*
  %load = load i32 addrspace(1)* %cast, align 1
  %x = bitcast i32 %load to <2 x i16>
  %castOut = bitcast i16 addrspace(1)* %out to <2 x i16> addrspace(1)*
  store <2 x i16> %x, <2 x i16> addrspace(1)* %castOut, align 1
  ret void
}

; EG-LABEL: @anyext_load_lds_i8:
; EG: AND_INT
; EG-NEXT: 255
define void @anyext_load_lds_i8(i8 addrspace(3)* nocapture noalias %out, i8 addrspace(3)* nocapture noalias %src) nounwind {
  %cast = bitcast i8 addrspace(3)* %src to i32 addrspace(3)*
  %load = load i32 addrspace(3)* %cast, align 1
  %x = bitcast i32 %load to <4 x i8>
  %castOut = bitcast i8 addrspace(3)* %out to <4 x i8> addrspace(3)*
  store <4 x i8> %x, <4 x i8> addrspace(3)* %castOut, align 1
  ret void
}

; EG-LABEL: @anyext_load_lds_i16:
; EG: AND_INT
; EG: LSHL
; EG: 65535
define void @anyext_load_lds_i16(i16 addrspace(3)* nocapture noalias %out, i16 addrspace(3)* nocapture noalias %src) nounwind {
  %cast = bitcast i16 addrspace(3)* %src to i32 addrspace(3)*
  %load = load i32 addrspace(3)* %cast, align 1
  %x = bitcast i32 %load to <2 x i16>
  %castOut = bitcast i16 addrspace(3)* %out to <2 x i16> addrspace(3)*
  store <2 x i16> %x, <2 x i16> addrspace(3)* %castOut, align 1
  ret void
}
