class User < ActiveRecord::Base

  as_enum :gender, [:female, :male]

end
