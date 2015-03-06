def counts_to_zero(n)

  if n <= 0
    
    puts n.to_s

  else

    puts n.to_s

    counts_to_zero(n-1)

  end

end

counts_to_zero(10)