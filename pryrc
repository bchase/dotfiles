h = { a: 'b', c: 'd' }
arr = %w[ a b c ]

module Kernel
  alias :pn :Pathname
end

class Hash
  def h(sym)
    self[sym] || self[sym.to_s]
  end

  def method_missing(sym, *args, &block)
    if m = sym.to_s.match(/^\_\_(.+)/)
      h(m[1].to_sym)
    else
      super
    end
  end
end

def timer(minutes: 25)
  sleep minutes*60 and `espeak ding`
end
alias :po :timer
def por
  timer minutes: 5
end
