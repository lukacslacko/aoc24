data =: <;._1 LF,CR-.~1!:1<'day24.txt'
compute =: 0$''
{{
  pieces =: <;._1 ' ',y
  if. 2=#pieces do.
    ".(}:>{.pieces),'=:',>{:pieces
  elseif. 5=#pieces do.
    compute =: compute,<pieces
  end.
}} &.> data
{{
  while. *#compute do.
    pieces =: >{.compute
    compute =: }.compute
    if. (|4!:0 {.pieces) +. |(4!:0)2{pieces do.
      compute =: compute, <pieces
    else.
      select. >1{pieces
        case. 'OR' do.
          op =: ' 23 b.'
        case. 'XOR' do.
          op =: ' 22 b.'
        case. 'AND' do.
          op =: ' 17 b.'
      end.
      ".(>{:pieces),'=:',(>{.pieces),op,>2{pieces
    end.
  end.
}} _
echo ]F.:([+2*])"./:~>'z'4!:1>0