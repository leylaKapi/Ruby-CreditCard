class CreditCard
  def initialize number
    raise CardNumberSizeError unless valid?(number)
    @number=number  end
  def type
    case
      when visa? then  "VISA"
      when master? then  "MASTER"
      when amex? then  "AMEX"
      when china? then  "CHINA"
      when jcb? then  "JCB"
      when discovery? then  "DISCOVERY"
        else puts "This number doesn't exist. Try Again"
  end
end

private

def valid?(num)
  num.size == 16
end

def visa?
  @number =~/^4[0-9]{6,}$/
end

def master?
  @number =~ /^5[1-5][0-9]{5,}$/
end

def amex?
  @number =~ /^3[47][0-9]{5,}$/
end

def china?
  @number =~ /^(62|88[0-9])/
end

def jcb?
  @number=~ /^(?:2131|1800|35[0-9]{3})[0-9]{3,}$/
end

def discovery?
  @number =~/^6(?:011|5[0-9]{2})[0-9]{3,}$/
end
end

class CardNumberSizeError < StandardError
  def message
    "Card Number size can be 16(hexadecimal) number."
  end
  end
puts "Enter card number: "
number=gets.chomp

cc=CreditCard.new(number)
puts cc.type



