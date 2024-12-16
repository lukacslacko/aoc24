i=:[;._1 LF,CR-.~1!:1<'day16_apa.txt'
f=:4#,i
r=:{{e=.,:y
d=.0 y}_#~#f
while.0<#e do.
q=.4|{.e
o=.((q-~{.e)+q-.~i.4),({.e)+x*4*q{1,(-#i),_1,#i
b=.'#'~:o{f
p=.b#o
w=.(b#(3#1000),1)+d{~{.e
e=.(]/:d{~])(}.e),(w<p{d)#p
d=.(w<.p{d)p}d
end.
d}}
S=:1 r f i.'S'
A=:<./(f='E')#S
B=:#~.(]-4|])I.(=<./)S+_1 r{.I.(f='E')*S=A
echo A;B
