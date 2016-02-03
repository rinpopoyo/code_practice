class User < ActiveRecord::Base
  enum gender: { unknown: 0, male: 1, female: 2, other: 9 }

end
