# Runtime
module Ruddy; end

def cx(*args)
  Ruddy::Capture.new(args)
end
def na(k,v)
  Ruddy::NamedArgument.new(k,v)
end

class Ruddy::NamedArgument
  attr_accessor :key, :value
  def initialize(key,value)
    @key,@value = key,value
  end
end

class Ruddy::Capture
  attr_accessor :args
  def initialize(args)
    @args=args
  end
  def positional
    @args.find_all {|a| !a.is_a?(Ruddy::NamedArgument) }
  end
  def named
    @args.find_all {|a|  a.is_a?(Ruddy::NamedArgument) }
  end
  def pos(n=nil)
    p = positional
    n = @args.length if not n
    if p.length != n
      raise "boom"
    end
    p
  end
end


# Runtime/Perl5/Array
class Array
  def map_n(f,n=nil)
    n ||= f.arity
    i = 0
    result = []
    while true
      s = self.slice(i,n)
      return result if not s
      if n > s.length
        s.push(*Array.new(n - s.length){|i|Undef.new})
      end
      result.push(*f.(*s))
    end
  end

  # new
  def m_values; ->(){self.values}; end
  # FETCH eager INDEX
  def m_elems; ->(){self.length}; end
  def m_push; end
  def m_pop; ->(){self.pop}; end
  def m_shift; ->(){self.shift}; end
  def m_unshift; end
  def m_sort; ->(f){}; end
  def m_map; ->(f){self.map_n(f)}; end
end

#

class Object
  def is_true6?; (not self or self == 0) ? false : true; end
end


# random cruft

class Undef; end

class Bit
  attr_accessor :bit
  def initialize(bit=false); @bit = bit ? true : false; end
  def to_int; @bit ? 1 : 0; end
  alias :method_missing_Bit :method_missing
  def method_missing(m,*args,&block)
    if 1.respond_to?(m)
    then to_int.send(m,*args)
    else method_missing_Bit(m,*args,&block) end
  end
  def coerce other
    if other.respond_to?(:+)
      [to_int, other]
    else
      [self, other]
    end
  end
end

class Pair
  attr_accessor :key, :value
  def initialize(key,value)
    @key,@value = key,value
  end
end


def c_say; ->(c){print *c.pos,"\n"}; end
#infix:<~>
def c_infix_58__60__126__62_; ->(c){c.pos.join("")}; end
#infix:<+>
def c_infix_58__60__43__62_; ->(c){a=c.pos;a[0]+a[1]}; end
#infix:<==>
def c_infix_58__60__61__61__62_; ->(c){a=c.pos;a[0]==a[1]}; end



class Object; def __getobj__; self end end

# Is there now a better alternative to this?
require 'delegate'
class BetterDelegator < Delegator; end
class << Object
  alias :pre_BetterDelegator_method_added :method_added
  def method_added(id)
    #print "method_added(#{id.id2name}) on #{self}\n"
    if self == Object
      #print "punting #{id.id2name}\n"
      BetterDelegator.funcall(:undef_method,id)
    end
    pre_BetterDelegator_method_added(id)
  end
end

class Variable < BetterDelegator
  attr_accessor :__getobj__
  def initialize(*args)
    super(nil)
    _(*args)
  end
  def _(*opt)
    o, = *opt
    #o = *o.to_a if o.listy?
    o ||= Undef.new
    __setobj__(o)
  end
  def __setobj__(o)
    @__getobj__= o
  end
end


