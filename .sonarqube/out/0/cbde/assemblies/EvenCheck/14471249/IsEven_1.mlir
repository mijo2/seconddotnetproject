func @_EvenCheck.IsEven.check$int$(i32) -> i1 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :4 :8) {
^entry (%_x : i32):
%0 = cbde.alloca i32 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :4 :33)
cbde.store %_x, %0 : memref<i32> loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :4 :33)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.load %0 : memref<i32> loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :5 :15)
%2 = constant 2 : i32 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :5 :17)
%3 = remis %1, %2 : i32 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :5 :15)
%4 = constant 0 : i32 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :5 :22)
%5 = cmpi "eq", %3, %4 : i32 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :5 :15)
cond_br %5, ^1, ^2 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :5 :15)

^1: // JumpBlock
%6 = constant 1 : i1 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :6 :23) // true
return %6 : i1 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :6 :16)

^2: // JumpBlock
%7 = constant 0 : i1 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :7 :19) // false
return %7 : i1 loc("C:\\Users\\miljolly\\Desktop\\Sapient_Courses-master\\seconddotnetproject\\EvenCheck\\IsEven.cs" :7 :12)

^3: // ExitBlock
cbde.unreachable

}
