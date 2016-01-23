h = { a: 'b', c: 'd' }
arr = %w[ a b c ]

module Kernel
  alias :pn :Pathname
end

def timer(minutes: 25)
  sleep minutes*60 and `espeak ding`
end
alias :po :timer
def por
  timer minutes: 5
end
